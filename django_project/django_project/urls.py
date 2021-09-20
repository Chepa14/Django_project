"""django_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static
from .views import home

main_url = [
    # TODO add urls started with api/
]

urlpatterns = [
    url('admin/', admin.site.urls),
    url('api/', include('user.urls')),
    url('home/', home, name='home'),
    url('', include('news.urls')),
    url('', include('artist.urls')),
    # url('auth/login/', LoginView.as_view()),
    # url('auth/registration/', RegistrationApiView.as_view()),
    # url(r'^accounts/', include('allauth.urls')),
    # url('accounts/login/', LoginApiView.as_view())
]

urlpatterns = urlpatterns + static(settings.MEDIA_URL,
                                   document_root=settings.MEDIA_ROOT)
