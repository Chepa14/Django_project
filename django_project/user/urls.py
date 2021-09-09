from django.urls import path
from .views import about, albums, contact, blog

# URLConf
urlpatterns = [
    path('about/', about),
    path('albums/', albums),
    path('blog/', blog),
    path('contact/', contact),
]