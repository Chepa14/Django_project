from django.urls import path
from .views import ArtistView, NewsView, home, ArtistList, NewsList
from .models import Artist, News
from .serializers import ArtistSerializer, NewsSerializer

# URLConf
urlpatterns = [
    path('', home, name='home'),
    # path('artists/', ArtistView.as_view()),
    # path('artists/<int:id>/', ArtistView.as_view()),
    # path('news/', NewsView.as_view())
    path('artists/', ArtistList.as_view(queryset=Artist.objects.all(), serializer_class=ArtistSerializer), name='artist-list'),
    path('news/', NewsList.as_view(queryset=News.objects.all(), serializer_class=NewsSerializer), name='news-list')
]
