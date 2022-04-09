from django.urls import path
from .views import (
    ArtistListCreateAPIView,
    ArtistRetrieveUpdateDestroyAPIView,
    SongRetrieveUpdateDestroyAPIView,
    SongsListCreateAPIView,
    LikeArtistRetrieveAPIView,
    ArtistRecommendationListCreateAPIView,
    ArtistLikesRecommendationListCreateAPIView
)

urlpatterns = [
    path("", ArtistListCreateAPIView.as_view(), name="list-create-view"),
    path("recommendation/<str:pseudonym_limit>/",
         ArtistRecommendationListCreateAPIView.as_view(), name="list-recommendation-view"),
    path("recommendation/likes/<int:limit>/",
         ArtistLikesRecommendationListCreateAPIView.as_view(), name="list-likes-recommendation-view"),
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
