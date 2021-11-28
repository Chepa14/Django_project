from rest_framework import serializers
from news.models import News, Comment


class CommentSerializer(serializers.ModelSerializer):

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        ret['author'] = {
            'id': instance.author.id,
            'username': instance.author.username,
            'avatar': instance.author.avatar or None
        }
        return ret

    class Meta:
        model = Comment
        fields = ("text", "author", "create_datetime")
        read_only_fields = ("create_datetime",)


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
            "author"
        )
        read_only_fields = ('create_datetime', 'update_datetime')

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        ret['author'] = {
            'id': instance.author.id,
            'username': instance.author.username,
            'avatar': instance.author.avatar or None
        }
        last_comment = instance.comments.last()
        if last_comment:
            ret['last_comment'] = CommentSerializer(last_comment).to_representation(last_comment)
        return ret
