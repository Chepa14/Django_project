from django.urls import path
from .views import NewsListCreateAPIView, NewsRetrieveUpdateDestroyAPIView, CommentsListCreateAPIView, \
    NewsTitleRecommendationsListAPIView, NewsSameAuthorRecommendationsListAPIView

urlpatterns = [
    path('', NewsListCreateAPIView.as_view(), name='list-create-view'),
    path('recommendations/<str:title_limit>/',
         NewsTitleRecommendationsListAPIView.as_view(), name='list-title-recommendations-view'),
    path('recommendations/author/<str:authorID_limit>/',
         NewsSameAuthorRecommendationsListAPIView.as_view(), name='list-same-author-recommendations-view'),
    path('<int:pk>/', NewsRetrieveUpdateDestroyAPIView.as_view(), name='retrieve-update-destroy-view'),
    path('<int:pk>/comments/', CommentsListCreateAPIView.as_view(), name='comments-list-create')
]
