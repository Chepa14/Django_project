from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from django.shortcuts import get_object_or_404
from .serializers import ArtistSerializer, SongSerializer
from django.http import HttpResponseRedirect
from rest_framework.decorators import api_view, permission_classes
from django.db.models import Value as V
from django.db.models.functions import Concat
from django.db.models import Q
from django.urls import reverse
from .models import Artist, Song


@api_view(['GET'])
@permission_classes((IsAuthenticated,))
def like_artist(request, id):
    artist = get_object_or_404(Artist, id=id)
    if artist.likes.filter(id=request.user.id).exists():
        artist.likes.remove(request.user)
    else:
        artist.likes.add(request.user)
    artist.number_of_likes = artist.number_of_likes
    artist.save()
    return HttpResponseRedirect(reverse("artist", args=[str(id)]))


class ArtistView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer
    queryset = Artist.objects.all()
    lookup_field = "id"


class ArtistList(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArtistSerializer

    def get_queryset(self):
        full_name = self.kwargs.get("full_name")
        if full_name:
            return Artist.objects.annotate(
                _full_name=Concat("first_name", V(" "), "last_name")
            ).filter(
                Q(_full_name__icontains=full_name) | Q(pseudonym__icontains=full_name)
            )
        else:
            return Artist.objects.all()


class SongView(RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer

    def get_object(self):
        return Song.objects.filter(author__id=self.kwargs["artist_id"]).get(
            pk=self.kwargs["song_id"]
        )


class SongsList(ListCreateAPIView):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SongSerializer

    def get_queryset(self):
        current_artist_songs = Song.objects.filter(author__id=self.kwargs["artist_id"])
        search_name = self.kwargs.get("search_name")
        if search_name:
            filtered_songs = current_artist_songs.annotate(
                artist_name=Concat("author__first_name", V(" "), "author__last_name")
            ).filter(
                Q(artist_name__icontains=search_name)
                | Q(author__pseudonym__icontains=search_name)
                | Q(name__icontains=search_name)
            )
            return filtered_songs.distinct()
        else:
            return current_artist_songs

    def get_serializer_context(self):
        return {"artist_id": self.kwargs["artist_id"]}
