from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from .serializers import ArtistSerializer, SongSerializer
from artist.filters import ArtistsListFilter, SongsListFilter
from .models import Artist, Song


class LikeArtistRetrieveAPIView(RetrieveAPIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()

    def get_object(self):
        obj = super().get_object()
        if obj.likes.filter(id=self.request.user.id).exists():
            obj.likes.remove(self.request.user)
        else:
            obj.likes.add(self.request.user)
        obj.number_of_likes = obj.number_of_likes
        obj.save()
        return obj


class ArtistRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()


class ArtistListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    filterset_class = ArtistsListFilter
    queryset = Artist.objects.all()


class SongRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer

    def get_queryset(self):
        return Song.objects.filter(author__id=self.kwargs["artist_id"])


class SongsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer
    filterset_class = SongsListFilter

    def perform_create(self, serializer):
        if not serializer.validated_data['author']:
            current_artist = Artist.objects.get(pk=self.kwargs['artist_id'])
            serializer.save(author=[current_artist])
        else:
            serializer.save()

    def get_queryset(self):
        return Song.objects.filter(author__id=self.kwargs["artist_id"])
