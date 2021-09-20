from rest_framework import serializers


class NewsSerializer(serializers.Serializer):
    title = serializers.CharField()
    img = serializers.ImageField()
    desc = serializers.CharField()
    date = serializers.DateTimeField()
