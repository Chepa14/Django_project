from django_filters import FilterSet
from artist.models import Artist, Song


class ArtistsListFilter(FilterSet):
    class Meta:
        model = Artist
        fields = {
            'pseudonym': ['contains']
        }


class SongsListFilter(FilterSet):
    class Meta:
        model = Song
        fields = {
            'author__pseudonym': ['exact'],
            'name': ['contains']
        }
