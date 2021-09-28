from rest_framework.serializers import ModelSerializer
from django.contrib.auth import get_user_model
from user.models import User


class UserSerializer(ModelSerializer):
    class Meta:
        # model = get_user_model()
        model = User
        fields = ("username", "email", "first_name", "last_name", "about_me", "avatar")
        read_only_fields = ("username", "email")
