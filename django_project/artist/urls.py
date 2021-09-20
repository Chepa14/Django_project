from django.urls import path
from .models import Artist
from .views import ArtistView, ArtistList
from .serializers import ArtistSerializer

# URLConf
urlpatterns = [
    # path('artists/', ArtistView.as_view()),
    # path('artists/<int:id>/', ArtistView.as_view()),
    path('artists/', ArtistList.as_view(queryset=Artist.objects.all(), serializer_class=ArtistSerializer), name='artist-list'),
]
