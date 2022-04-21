from django_filters import FilterSet, CharFilter, NumberFilter, BooleanFilter
from news.models import News
from django.db.models import Q


class NewsListFilter(FilterSet):
    search = CharFilter(method='custom_filter')
    limit = NumberFilter(method='pagination_filter')
    shuffle = BooleanFilter(method='shuffle_news')

    class Meta:
        model = News
        fields = ('search', 'limit')

    def custom_filter(self, queryset, _, value):
        search_values = value.split(" ")
        q = Q()
        for search_value in search_values:
            q |= Q(title__icontains=search_value) | \
                 Q(tags__pseudonym__icontains=search_value)
        return queryset.filter(q).distinct()

    def pagination_filter(self, queryset, _, value):
        return queryset[:value]

    def shuffle_news(self, queryset, _, value):
        if value:
            return queryset.order_by('?')
        return queryset
