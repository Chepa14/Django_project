from rest_framework.test import APITestCase
from django.urls import reverse
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_405_METHOD_NOT_ALLOWED,
    HTTP_201_CREATED,
    HTTP_400_BAD_REQUEST,
)
from user.models import User


class AuthTest(APITestCase):
    def setUp(self) -> None:
        self.register_url = reverse("register")
        self.login_url = reverse("login")

    def test_register_page_get_method_failed(self):
        response = self.client.get(self.register_url)
        self.assertEqual(response.status_code, HTTP_405_METHOD_NOT_ALLOWED)

    def test_register_page_post_method_successful(self):
        post_data = {
            "username": "Ivan",
            "email": "i.chepets@email.com",
            "password1": "023320qw",
            "password2": "023320qw",
        }
        response = self.client.post(self.register_url, post_data)
        self.assertEqual(response.status_code, HTTP_201_CREATED)

    def test_register_page_post_method_failed(self):
        post_data = {
            "username": "Ivan",
            "email": "",
            "password1": "023320qw",
            "password2": "023320qw",
        }
        response = self.client.post(self.register_url, post_data)
        self.assertEqual(response.status_code, HTTP_400_BAD_REQUEST)

    def test_login_page_get_method_failed(self):
        response = self.client.get(self.login_url)
        self.assertEqual(response.status_code, HTTP_405_METHOD_NOT_ALLOWED)

    # def test_login_page_post_method_failed(self):
    #     user = User.objects.create_user("Ivan", "", "023320qw")
    #     token, is_created = Token.objects.get_or_create(user=user)
    #     self.client.credentials(HTTP_AUTHORIZATION=f"Token {token.key}")
    #     self.client.force_login(user)
    #
    #     post_data = {
    #         "username": "Ivan",
    #         "email": "",
    #         "password": "023320qw"
    #     }
    #     response = self.client.post(self.login_url, post_data)
    #     print(response.data)
    #     self.assertEqual(response.status_code, HTTP_200_OK)
