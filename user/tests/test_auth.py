from rest_framework.test import APITestCase
from django.core import mail
from django.urls import reverse
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_405_METHOD_NOT_ALLOWED,
    HTTP_201_CREATED,
    HTTP_400_BAD_REQUEST,
)
import re
from user.models import User


class AuthTest(APITestCase):
    def setUp(self) -> None:
        self.register_url = reverse("account_signup")
        self.login_url = reverse("account_login")
        self.confirm_email = reverse("account_email_verification_sent")

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
        last_user = User.objects.all().last()
        last_user_field = last_user.email
        self.assertEqual(post_data["email"], last_user_field)
        self.assertEqual(response.data['detail'], 'Verification e-mail sent.')

    def test_register_page_post_method_failed(self):
        post_data = {
            "username": "Ivan",
            "email": "",
            "password1": "023320qw",
            "password2": "023320qw",
        }
        response = self.client.post(self.register_url, post_data)
        self.assertEqual(response.status_code, HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data["email"][0], "This field may not be blank.")

    def test_login_page_get_method_failed(self):
        response = self.client.get(self.login_url)
        self.assertEqual(response.status_code, HTTP_405_METHOD_NOT_ALLOWED)

    def test_login_page_post_method_successful(self):
        self.test_register_page_post_method_successful()

        post_data = {
            "username": "Ivan",
            "email": "i.chepets@email.com",
            "password": "023320qw",
        }
        response = self.client.post(self.login_url, post_data)
        self.assertEqual(response.status_code, HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data['non_field_errors'][0], "E-mail is not verified.")

        token_regex = r"\/account-confirm-email\/([A-Za-z0-9:\-_]+)\/"
        email_content = mail.outbox[0].body
        match = re.search(token_regex, email_content)
        self.assertNotEqual(match, None)
        token = match.group(1)

        response = self.client.post(self.confirm_email, {'key': token})
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data['detail'], 'ok')

    def test_login_page_post_method_failed(self):
        user = User.objects.create_user("Ivan", "", "023320qw")
        self.client.force_login(user)

        post_data = {
            "username": "Ivan Chepets",
            "email": "",
            "password": "023320qw"
        }
        response = self.client.post(self.login_url, post_data)
        self.assertEqual(response.status_code, HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data["non_field_errors"][0], "Unable to log in with provided credentials.")
