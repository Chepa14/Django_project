from django.urls import path
from .views import NewsView, NewsList
from .models import News
from .serializers import NewsSerializer

# URLConf
urlpatterns = [
    # path('news/', NewsView.as_view())
    path('news/', NewsList.as_view(queryset=News.objects.all(), serializer_class=NewsSerializer), name='news-list')
]
