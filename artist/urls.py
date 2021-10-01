from django.urls import path
from .views import ArtistView, ArtistList, SongView, SongsList

urlpatterns = [
    path('<int:id>/', ArtistView.as_view(), name='artist'),
    path('', ArtistList.as_view(), name='artist-list'),
    path('<int:artist_id>/songs/', SongsList.as_view(), name='songs-list'),
    path('<int:artist_id>/songs/<int:song_id>/', SongView.as_view(), name='songs')
]
