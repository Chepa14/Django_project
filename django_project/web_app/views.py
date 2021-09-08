from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.permissions import IsAdminUser
from .models import Artist, News
from .serializers import ArtistSerializer, NewsSerializer


class ArtistView(APIView):
    def get(self, request):
        artists = Artist.objects.all()
        serializer = ArtistSerializer(artists, many=True)
        return Response(serializer.data)

    def post(self, request):
        artist = request.data.get("artist")

        # Create an article from the above data
        serializer = ArtistSerializer(data=artist)
        if serializer.is_valid(raise_exception=True):
            article_saved = serializer.save()
        return Response(
            {"success": "Article '{}' created successfully".format(article_saved.title)}
        )


class NewsView(APIView):
    def get(self, request):
        news = News.objects.all()
        serializer = NewsSerializer(news, many=True)
        return Response({"news": serializer.data})


class ArtistList(generics.ListCreateAPIView):
    queryset = Artist.objects.all()
    serializer_class = ArtistSerializer
    permission_classes = [IsAdminUser]

    def list(self, request):
        # Note the use of `get_queryset()` instead of `self.queryset`
        queryset = self.get_queryset()
        serializer = ArtistSerializer(queryset, many=True)
        return Response(serializer.data)


class NewsList(generics.ListCreateAPIView):
    queryset = News.objects.all()
    serializer_class = NewsSerializer
    permission_classes = [IsAdminUser]

    def list(self, request):
        # Note the use of `get_queryset()` instead of `self.queryset`
        queryset = self.get_queryset()
        serializer = NewsSerializer(queryset, many=True)
        return Response(serializer.data)


def home(request):
    artists = Artist.objects.all()
    news = News.objects.all()

    bckg_img = "https://wallpapers-hub.art/wallpaper-images/781042.jpg"
    hip_hop_icon = "https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"
    bckg_img_top = "https://www.birthplacemag.com/wp-content/uploads/2015/03/kendrick-lamar-pimp-butterfly.jpg"

    return render(
        request,
        "index.html",
        {
            "artists": artists,
            "background_img": bckg_img,
            "icon": hip_hop_icon,
            "background_img_top": bckg_img_top,
            "news": news,
        },
    )
