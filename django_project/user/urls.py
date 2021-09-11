from django.urls import path
from .views import about, albums, blog, CurrentUserApiView

# URLConf
urlpatterns = [
    path('about/', about),
    path('albums/', albums),
    path('blog/', blog),
    path('users/', CurrentUserApiView.as_view())
]