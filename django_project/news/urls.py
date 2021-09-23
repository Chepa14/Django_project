from django.urls import path
from .views import NewsView, NewsList

# URLConf
urlpatterns = [
    path('<int:id>/', NewsView.as_view(), name='news'),
    path('', NewsList.as_view(), name='news-list')
]
