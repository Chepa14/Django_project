from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import ListCreateAPIView
from rest_framework.permissions import IsAdminUser
from .models import Artist
from .serializers import ArtistSerializer


# Create your views here.

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


class ArtistList(ListCreateAPIView):
    queryset = Artist.objects.all()
    serializer_class = ArtistSerializer
    permission_classes = [IsAdminUser]

    def list(self, request):
        # Note the use of `get_queryset()` instead of `self.queryset`
        queryset = self.get_queryset()
        serializer = ArtistSerializer(queryset, many=True)
        return Response(serializer.data)
