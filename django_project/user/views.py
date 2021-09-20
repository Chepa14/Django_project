from django.shortcuts import render, redirect
from rest_framework.views import APIView  # TODO Difference between Generic and .
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.response import Response
from django.contrib.auth import get_user
from .serializers import UserSerializer


# Create your views here.
hip_hop_icon = "https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"


class CurrentUserApiView(APIView):  # TODO RetriveUpdateAPIView ??
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)  # TODO add permission to each endpoint

    def get(self, request):
        curr_user = get_user(request)
        if curr_user.is_authenticated:
            serializer = UserSerializer(curr_user)
            args = {
                'icon': hip_hop_icon,
                'user': serializer.data
            }
            return Response(serializer.data)
        else:
            return Response('Need to login!')


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
