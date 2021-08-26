from django.urls import path
from .views import home #ArtistView, NewsView, home

# URLConf
urlpatterns = [
    path('', home, name='home'),
    # path('artists/', ArtistView.as_view())
]
