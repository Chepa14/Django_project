from rest_framework.serializers import ModelSerializer
from django.contrib.auth import get_user_model


class UserSerializer(ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ("username", "email", "first_name", "last_name", "about_me", "avatar")
        read_only_fields = ("username", "email")