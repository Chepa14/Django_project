from rest_framework import serializers


class NewsSerializer(serializers.Serializer):
    title = serializers.CharField()
    image = serializers.ImageField()
    description = serializers.CharField()
    date = serializers.DateTimeField()
