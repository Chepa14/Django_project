from django.urls import path
from .views import NewsListCreateAPIView, NewsRetrieveUpdateDestroyAPIView, CommentsListCreateAPIView

urlpatterns = [
    path('', NewsListCreateAPIView.as_view(), name='list-create-view'),
    path('<int:pk>/', NewsRetrieveUpdateDestroyAPIView.as_view(), name='retrieve-update-destroy-view'),
    path('<int:pk>/comments/', CommentsListCreateAPIView.as_view(), name='comments-list-create')
]
