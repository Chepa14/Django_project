from django.urls import path
from .views import ArtistView, ArtistList, SongView, SongsList, like_artist

urlpatterns = [
    path('', ArtistList.as_view(), name='artist-list'),
    path('<int:id>/', ArtistView.as_view(), name='artist'),
    path('<str:full_name>/', ArtistList.as_view(), name='artists-filtered-by-name'),
    path('<int:id>/like/', like_artist, name='like-artist'),
    path('<int:artist_id>/songs/', SongsList.as_view(), name='artist-songs-list'),
    path('<int:artist_id>/songs/<int:song_id>/', SongView.as_view(), name='artist-song'),
    path('<int:artist_id>/songs/<str:search_name>/', SongsList.as_view(), name='artist-songs-filtered-by-name')
]
