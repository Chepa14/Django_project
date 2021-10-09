from django.urls import path
from .views import NewsView, NewsList, comment_news

urlpatterns = [
    path('<int:id>/', NewsView.as_view(), name='news'),
    path('<str:search_name>/', NewsList.as_view(), name='filtered-news'),
    path('<int:id>/comment/', comment_news, name='comment-news'),
    path('', NewsList.as_view(), name='news-list')
]
