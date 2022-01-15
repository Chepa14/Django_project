from rest_auth.registration.views import RegisterView, VerifyEmailView
from rest_framework_swagger.views import get_swagger_view
from django.conf.urls.static import static
from rest_auth.views import LoginView, LogoutView, PasswordChangeView
from django.urls import path, re_path, include
from django.contrib import admin
from .views import home
from django_project import settings

schema_view = get_swagger_view(title="Django Project Swagger")

main_url = [
    path("user/", include("user.urls")),
    path("news/", include(("news.urls", "news"), namespace="news")),
    path("artists/", include(("artist.urls", "artists"), namespace="artists"))
]

urlpatterns = [
    path("", home, name="home"),
    path("admin/", admin.site.urls),
    path("api/", include(main_url)),
    path("auth/login/", LoginView.as_view(), name="account_login"),
    path("auth/registration/", RegisterView.as_view(), name="account_signup"),
    path("auth/logout/", LogoutView.as_view(), name="account_logout"),
    path("auth/change_password/", PasswordChangeView.as_view(), name="password_change"),
    path(
        "account-confirm-email/",
        VerifyEmailView.as_view(),
        name="account_email_verification_sent",
    ),
    re_path(
        r"account-confirm-email/(?P<key>[-:\w]+)/$",
        VerifyEmailView.as_view(),
        name="account_confirm_email",
    ),
    path("rest_docs", schema_view),
]

urlpatterns = urlpatterns + \
              static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
              static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
