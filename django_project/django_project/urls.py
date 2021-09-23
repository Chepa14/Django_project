from rest_auth.registration.views import RegisterView
from rest_framework_swagger.views import get_swagger_view
from django.conf.urls.static import static
from rest_auth.views import LoginView
from django.urls import path, include
from django.contrib import admin
from django.conf import settings
from .views import home

schema_view = get_swagger_view(title='Django Project Swagger')

main_url = [
    path('', include('user.urls')),
    path('news/', include('news.urls')),
    path('artists/', include('artist.urls')),
    path('auth/login/', LoginView.as_view()),
    # path('auth/registration/', RegisterView.as_view()),
    path('rest-auth/registration/', include('rest_auth.registration.urls')),
    path('rest-auth/', include('rest_auth.urls')),
    path('accounts/', include('allauth.urls')),
]

urlpatterns = [
    path('', home, name='home'),
    path('admin/', admin.site.urls),
    path('api/', include(main_url)),
    path('rest_docs', schema_view)
]

urlpatterns = urlpatterns + static(settings.MEDIA_URL,
                                   document_root=settings.MEDIA_ROOT)
