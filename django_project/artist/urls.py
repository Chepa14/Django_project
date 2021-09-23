from django.urls import path
from .views import ArtistView, ArtistList

# URLConf
urlpatterns = [
    path('<int:id>/', ArtistView.as_view(), name='artist'),
    path('', ArtistList.as_view(), name='artist-list'),
]
