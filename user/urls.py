from django.urls import path, include
from .views import CurrentUserApiView

urlpatterns = [
    path('', CurrentUserApiView.as_view(), name="user_detail"),
]
