from django.urls import path
from .views import ArtistView, NewsView, home

# URLConf
urlpatterns = [
    path('', home, name='home'),
    path('artists/', ArtistView.as_view()),
    path('news/', NewsView.as_view())
]
