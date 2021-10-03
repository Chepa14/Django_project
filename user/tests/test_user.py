from rest_framework.test import APITestCase
from user.models import User
from rest_framework.status import HTTP_200_OK, HTTP_401_UNAUTHORIZED
from django.urls import reverse


class UserTest(APITestCase):
    fixtures = ("user_fixtures.json",)

    def setUp(self) -> None:
        self.url = reverse("user_detail")
        self.user = User.objects.get(pk=1)

    def test_get_current_user_failed_unauthorized(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)

    def test_get_current_user_successful_authorized(self):
        self.client.force_login(self.user)

        current_user_data = {
            "username": "User14",
            "email": "",
            "first_name": "Ivan",
            "last_name": "",
            "avatar": None,
            "about_me": "",
        }
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, current_user_data)

    def test_put_user_successful(self):
        self.client.force_login(self.user)

        response = self.client.put(self.url, {"about_me": "A few words"})
        self.assertEqual(response.status_code, HTTP_200_OK)

        updated_current_user_data = {
            "username": "User14",
            "email": "",
            "first_name": "Ivan",
            "last_name": "",
            "avatar": None,
            "about_me": "A few words",
        }
        self.assertEqual(response.data['about_me'], 'A few words')
        self.assertEqual(response.data, updated_current_user_data)

    def test_user_email_not_updated_successful(self):
        self.client.force_login(self.user)

        response = self.client.put(self.url, {"email": "test@mail.com"})
        self.assertNotEqual(response.data['email'], "test@mail.com")
        self.assertEqual(response.status_code, HTTP_200_OK)

    def test_user_username_not_updated_successful(self):
        self.client.force_login(self.user)

        response = self.client.put(self.url, {"username": "Chepets"})
        self.assertNotEqual(response.data['username'], "Chepets")
        self.assertEqual(response.status_code, HTTP_200_OK)
