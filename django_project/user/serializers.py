from rest_framework.serializers import ModelSerializer
from .models import User


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ("username", "email", "first_name", "last_name", "about_me", "avatar")
        read_only_fields = ("username", "email")
