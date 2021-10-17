from rest_framework import serializers
from .models import Song, Artist


class ArtistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Artist
        fields = (
            "pseudonym",
            "first_name",
            "last_name",
            "image",
            "likes_number",
            "description",
        )
        read_only_fields = ("likes_number",)

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        current_user = self.context["request"].user
        ret["is_liked"] = instance.likes.filter(id=current_user.id).exists()
        return ret


class SongSerializer(serializers.ModelSerializer):

    class Meta:
        model = Song
        fields = ("author", "name", "image", "media_file", "time_length_sec")
