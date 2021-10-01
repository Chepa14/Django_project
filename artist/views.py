from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .serializers import ArtistSerializer, SongSerializer
from .models import Artist, Song


class ArtistView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()
    lookup_field = 'id'


class ArtistList(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()


class SongView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer

    def get_object(self):
        return Song.objects.filter(author__id=self.kwargs['artist_id']).get(pk=self.kwargs['song_id'])


class SongsList(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer

    def get_queryset(self):
        return Song.objects.filter(author__id=self.kwargs['artist_id'])

    def get_serializer_context(self):
        return {"artist_id": self.kwargs['artist_id']}
