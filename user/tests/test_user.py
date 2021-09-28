from rest_framework.test import APITestCase
from django.contrib.auth import get_user_model
from rest_framework.status import HTTP_200_OK, HTTP_401_UNAUTHORIZED
from rest_framework.authtoken.models import Token
from django.urls import reverse


class UserTest(APITestCase):
    fixtures = ("user_fixtures.json",)

    def setUp(self) -> None:
        self.url = reverse("user_detail")
        self.user = get_user_model().objects.get(pk=1)
        self.user.set_password('023320qw')
        self.user.save()

    def test_get_wo_credentials(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)

    def test_get_with_credentials(self):
        self.client.force_login(self.user)
        token, is_created = Token.objects.get_or_create(user=self.user)
        self.client.credentials(HTTP_AUTHORIZATION=f"Token {token.key}")

        response = self.client.get(self.url)
        self.assertEqual(response.status_code, HTTP_200_OK)

    def test_put_user_successful(self):
        self.client.force_login(self.user)
        token, is_created = Token.objects.get_or_create(user=self.user)
        self.client.credentials(HTTP_AUTHORIZATION=f"Token {token.key}")

        response = self.client.put(self.url, {"about_me": "A few words"})
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data['about_me'], 'A few words')

    def test_patch_user_successful(self):
        self.client.force_login(self.user)
        token, is_created = Token.objects.get_or_create(user=self.user)
        self.client.credentials(HTTP_AUTHORIZATION=f"Token {token.key}")

        response = self.client.patch(self.url, {"last_name": "Chepets"})
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data['last_name'], 'Chepets')
