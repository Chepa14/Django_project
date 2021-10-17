from django.urls import path
from .views import (
    ArtistListCreateAPIView,
    ArtistRetrieveUpdateDestroyAPIView,
    SongRetrieveUpdateDestroyAPIView,
    SongsListCreateAPIView,
    # like_artist,
    LikeArtistRetrieveAPIView,
)

urlpatterns = [
    path("", ArtistListCreateAPIView.as_view(), name="list-create-view"),
    path(
        "<int:pk>/",
        ArtistRetrieveUpdateDestroyAPIView.as_view(),
        name="retrieve-update-destroy-view",
    ),
    path(
        "<int:pk>/like/",
        LikeArtistRetrieveAPIView.as_view(),
        name="like-retrieve-view"
    ),
    path(
        "<int:artist_id>/songs/",
        SongsListCreateAPIView.as_view(),
        name="songs-list-create-view",
    ),
    path(
        "<int:artist_id>/songs/<int:pk>/",
        SongRetrieveUpdateDestroyAPIView.as_view(),
        name="song-retrieve-update-destroy-view",
    ),
]
