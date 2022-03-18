from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView, UpdateAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from .serializers import ArtistSerializer, SongSerializer
from artist.filters import ArtistsFilter, SongsFilter
from .models import Artist, Song
from rest_framework.response import Response


class LikeArtistRetrieveAPIView(UpdateAPIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.likes.filter(id=self.request.user.id).exists():
            instance.likes.remove(self.request.user)
        else:
            instance.likes.add(self.request.user)
        instance.likes_number = instance.likes.count()
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class ArtistRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()

    # TODO add recommendation artists with pagination


class ArtistListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    filterset_class = ArtistsFilter
    queryset = Artist.objects.all()


class SongRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer

    def get_queryset(self):
        return Song.objects.filter(authors__id=self.kwargs["artist_id"])


class SongsListCreateAPIView(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer
    filterset_class = SongsFilter

    def perform_create(self, serializer):
        current_artist = Artist.objects.get(pk=self.kwargs['artist_id'])
        serializer.save(authors=[current_artist])

    def get_queryset(self):
        return Song.objects.filter(authors__id=self.kwargs["artist_id"])
