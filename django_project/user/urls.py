from django.urls import path, include
from .views import about, albums, blog, CurrentUserApiView

# URLConf
urlpatterns = [
    path('about/', about),
    path('albums/', albums),
    path('blog/', blog),
    path('user/', CurrentUserApiView.as_view()),
]
