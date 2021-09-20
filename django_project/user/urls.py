from django.urls import path, include
from .views import about, albums, blog, CurrentUserApiView
from django.conf.urls import url
from rest_auth.views import LoginView
from rest_auth.registration.views import RegisterView

# URLConf
urlpatterns = [
    path('about/', about),
    path('albums/', albums),
    path('blog/', blog),
    path('user/', CurrentUserApiView.as_view()),
    url('auth/login/', LoginView.as_view()),
    url('auth/registration/', RegisterView.as_view()),
    url(r'^accounts/', include('allauth.urls')),
]
