from rest_framework.response import Response
from rest_framework.generics import ListCreateAPIView, GenericAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .models import Artist
from .serializers import ArtistSerializer


class ArtistView(GenericAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def get(self, request, id=None):
        artists = Artist.objects.get(id=id)
        serializer = ArtistSerializer(artists)
        return Response(serializer.data)


class ArtistList(ListCreateAPIView):
    queryset = Artist.objects.all()
    serializer_class = ArtistSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)
