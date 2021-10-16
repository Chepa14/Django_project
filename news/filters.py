from django_filters import FilterSet, NumberFilter
from news.models import News, Comment


class NewsListFilter(FilterSet):
    class Meta:
        model = News
        fields = {
            'title': ['contains'],
            'tags': ['contains']
        }


class CommentsListFilter(FilterSet):

    class Meta:
        model = Comment
        fields = ('id',)
