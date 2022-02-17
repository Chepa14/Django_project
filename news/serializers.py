from datetime import datetime
from rest_framework import serializers
from news.models import News, Comment
from django.utils.dateparse import parse_datetime


class CommentSerializer(serializers.ModelSerializer):

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        ret['author'] = {
            'id': instance.author.id,
            'username': instance.author.username,
            'avatar': instance.author.avatar.url if instance.author.avatar else None
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
            "id",
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
        ret['create_datetime'] = instance.create_datetime.strftime("%Y-%m-%d")
        ret['image'] = instance.image.url if instance.image else None
        ret['author'] = {
            'id': instance.author.id,
            'username': instance.author.username,
            'avatar': instance.author.avatar.url if instance.author.avatar else None
        }
        ret['tags'] = [{'pseudonym': x.pseudonym, 'image': x.image.url} for x in instance.tags.all()]
        last_comment = instance.comments.last()
        if last_comment:
            ret['last_comment'] = CommentSerializer(last_comment).to_representation(last_comment)
        return ret
