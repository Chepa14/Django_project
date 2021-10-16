from rest_framework import serializers
from news.models import News, Comment


class CommentSerializer(serializers.ModelSerializer):

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        ret['author'] = {'id': instance.author.id}
        return ret

    class Meta:
        model = Comment
        fields = ("text", "author", "created_at")
        read_only_fields = ("author",)


class NewsSerializer(serializers.ModelSerializer):

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
            "comments"
        )
        read_only_fields = ('create_datetime', 'update_datetime', 'author', 'comments')

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        ret['author'] = {'id': instance.author.id}
        last_comment = instance.comments.last()
        if last_comment:
            ret['last_comment'] = CommentSerializer(last_comment).to_representation(last_comment)
        return ret
