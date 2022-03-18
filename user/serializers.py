from rest_framework.serializers import ModelSerializer
from user.models import User


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ("username", "email", "first_name", "last_name", "about_me", "avatar")
        read_only_fields = ("username", "email")

    def to_representation(self, instance):
        ret = super(UserSerializer, self).to_representation(instance)
        ret['avatar'] = instance.avatar.url if instance.avatar else None
        return ret
