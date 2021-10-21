from django_filters import FilterSet, CharFilter
from artist.models import Artist, Song
from django.db.models.functions import Concat
from django.db.models import Q
from django.db.models import Value as V


class ArtistsFilter(FilterSet):
    search = CharFilter(method='custom_filter', field_name='search')

    class Meta:
        model = Artist
        fields = []

    def custom_filter(self, queryset, _, value):
        search_values = value.split(" ")
        q = Q()
        # queryset = queryset.annotate(
        #             _full_name=Concat("first_name", V(" "), "last_name")
        #         )
        for search_value in search_values:
            q |= Q(first_name__icontains=search_value) | \
                 Q(last_name__icontains=search_value) | \
                 Q(pseudonym__icontains=search_value)
        return queryset.filter(q).distinct()


class SongsFilter(FilterSet):
    search = CharFilter(method='custom_filter', field_name='search')

    class Meta:
        model = Song
        fields = []

    def custom_filter(self, queryset, _, value):
        search_values = value.split(" ")
        q = Q()
        for search_value in search_values:
            q |= Q(name__icontains=search_value) |\
                    Q(authors__pseudonym__icontains=search_value)
        return queryset.filter(q).distinct()
