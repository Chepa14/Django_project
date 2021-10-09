from rest_framework import serializers
from user.serializers import UserSerializer
from artist.serializers import ArtistSerializer
from news.models import News, Comment


class CommentSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    text = serializers.CharField()
    created_on = serializers.DateTimeField(allow_null=True)

    class Meta:
        model = Comment
        fields = ("text", "author", "created_on")


class NewsSerializer(serializers.ModelSerializer):
    title = serializers.CharField(max_length=150)
    image = serializers.ImageField(allow_null=True)
    description = serializers.CharField(allow_blank=True)
    create_datetime = serializers.DateTimeField(allow_null=True)
    update_datetime = serializers.DateTimeField(allow_null=True)
    tags = ArtistSerializer(many=True, allow_null=True, default=[None])
    author = UserSerializer(many=False, allow_null=True, read_only=True)
    comments = CommentSerializer(many=True, default=[None])

    class Meta:
        model = News
        fields = (
            "title",
            "image",
            "description",
            "create_datetime",
            "update_datetime",
            "tags",
            "author",
            "comments",
        )

    def create(self, validated_data):
        tags_data = validated_data.pop("tags")
        comments_data = validated_data.pop("comments")
        request = self.context.get("request", None)
        author = request.user if request else None
        news = News.objects.create(
            **validated_data,
            author=author
        )

        news.tags.set(tags_data)
        news.comments.set(comments_data)
        news.save()
        return news
