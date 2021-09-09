from rest_framework import serializers


class ArtistSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=100)
    img = serializers.ImageField()
    desc = serializers.CharField()

class NewsSerializer(serializers.Serializer):
    title = serializers.CharField()
    img = serializers.ImageField()
    desc = serializers.CharField()
    date = serializers.DateTimeField()