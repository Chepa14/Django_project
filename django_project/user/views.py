from django.shortcuts import render, redirect
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from django.contrib.auth import get_user
from .serializers import UserSerializer
from .models import User

# Create your views here.
hip_hop_icon = "https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"


class CurrentUserApiView(APIView):
    authentication_classes = (authentication.TokenAuthentication,)
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

    def get(self, request):
        curr_user = get_user(request)
        if curr_user.is_authenticated:
            serializer = UserSerializer(curr_user)
            args = {
                'icon': hip_hop_icon,
                'user': serializer.data
            }
            return render(
                request,
                "contact.html",
                args
            )
        else:
            return redirect('/')  # TODO redirect to login page

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
