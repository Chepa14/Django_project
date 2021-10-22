from django_filters import FilterSet, CharFilter
from news.models import News
from django.db.models import Q


class NewsListFilter(FilterSet):
    search = CharFilter(method='custom_filter', field_name='search')

    class Meta:
        model = News
        fields = []

    def custom_filter(self, queryset, _, value):
        search_values = value.split(" ")
        q = Q()
        for search_value in search_values:
            q |= Q(title__icontains=search_value) | \
                 Q(tags__pseudonym__icontains=search_value)
        return queryset.filter(q).distinct()
