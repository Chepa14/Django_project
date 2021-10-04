from rest_framework import serializers
from user.serializers import UserSerializer
from .models import Song, Artist


class ArtistSerializer(serializers.Serializer):
    pseudonym = serializers.CharField(max_length=20)
    first_name = serializers.CharField(max_length=20, allow_blank=True)
    last_name = serializers.CharField(max_length=30, allow_blank=True)
    image = serializers.ImageField(allow_null=True)
    likes = UserSerializer(many=True, allow_null=True)
    likes_number = serializers.IntegerField(default=0, allow_null=True)
    description = serializers.CharField(allow_blank=True)

    def create(self, validated_data):
        validated_data.pop('likes')
        validated_data.pop('likes_number')
        artist = Artist.objects.create(**validated_data)
        return artist

    class Meta:
        model = Artist
        fields = ('pseudonym', 'first_name', 'last_name', 'image', 'likes', 'likes_number', 'description')
        read_only_fields = ('pseudonym', 'likes', 'likes_number')


class SongSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=30)
    image = serializers.ImageField(allow_null=True)
    author = ArtistSerializer(many=True, allow_null=True)
    time_length_sec = serializers.IntegerField(allow_null=True)

    class Meta:
        model = Song
        fields = ('author', 'name', 'image', 'time_length_sec')
        read_only_fields = ('author',)

    def create(self, validated_data):
        validated_data.pop('author')
        song = Song.objects.create(**validated_data)
        current_author = Artist.objects.get(pk=self.context['artist_id'])
        song.author.add(current_author)
        return song
