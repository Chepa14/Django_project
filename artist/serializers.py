from rest_framework import serializers
from user.serializers import UserSerializer
from .models import Song, Artist


class ArtistSerializer(serializers.ModelSerializer):
    pseudonym = serializers.CharField(max_length=20)
    first_name = serializers.CharField(max_length=20, allow_blank=True)
    last_name = serializers.CharField(max_length=30, allow_blank=True)
    image = serializers.ImageField(allow_null=True)
    likes = UserSerializer(many=True, allow_null=True, read_only=True)
    likes_number = serializers.IntegerField(default=0, allow_null=True, read_only=True)
    description = serializers.CharField(allow_blank=True)

    class Meta:
        model = Artist
        fields = ('pseudonym', 'first_name', 'last_name', 'image', 'likes', 'likes_number', 'description')


class SongSerializer(serializers.ModelSerializer):
    name = serializers.CharField(max_length=30)
    image = serializers.ImageField(allow_null=True)
    media_file = serializers.FileField(allow_null=True)
    author = ArtistSerializer(many=True, allow_null=True, read_only=True)
    time_length_sec = serializers.IntegerField(allow_null=True)

    class Meta:
        model = Song
        fields = ('author', 'name', 'image', 'media_file', 'time_length_sec')

    def create(self, validated_data):
        song = Song.objects.create(**validated_data)
        current_author = Artist.objects.get(pk=self.context['artist_id'])
        song.author.add(current_author)
        return song
