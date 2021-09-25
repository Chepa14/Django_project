from django.urls import path, include
from .views import about, albums, blog, CurrentUserApiView

urlpatterns = [
    path('about/', about),
    path('albums/', albums),
    path('blog/', blog),
    path('', CurrentUserApiView.as_view()),
]
