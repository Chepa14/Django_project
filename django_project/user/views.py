from django.shortcuts import render
from rest_framework.generics import RetrieveUpdateAPIView
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from .serializers import UserSerializer
from django.contrib.auth import get_user


# Create your views here.
hip_hop_icon = "https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"


class CurrentUserApiView(RetrieveUpdateAPIView):
    permission_classes = (IsAuthenticated, IsAdminUser,)
    serializer_class = UserSerializer

    def get_object(self):
        return get_user(self.request)


def about(request):
    return render(
        request,
        "about.html",
        {"icon": hip_hop_icon}
    )


def albums(request):
    return render(
        request,
        "album.html",
        {"icon": hip_hop_icon}
    )


def blog(request):
    return render(
        request,
        "blog.html",
        {"icon": hip_hop_icon}
    )
