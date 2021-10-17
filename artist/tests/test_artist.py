from rest_framework.test import APITestCase
from user.models import User
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_401_UNAUTHORIZED,
    HTTP_204_NO_CONTENT,
)
from django.urls import reverse


class ArtistTest(APITestCase):
    fixtures = ("artist_fixtures.json",)

    def test_get_artist_successful(self):
        artist_view = reverse("artists:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.get(artist_view)
        data = {
            "pseudonym": "RZA",
            "first_name": "Robert Fitzgerald",
            "last_name": "Diggs",
            "image": None,
            "description": "A few words...",
            "likes_number": 0,
            "is_liked": False
        }
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, data)

    def test_put_artist_failed_unauthorized(self):
        artist_view = reverse("artists:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.put(artist_view, {"first_name": "Robert"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_artist_successful_authorized(self):
        user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.client.force_login(user)
        put_data = {
            "pseudonym": "New pseudonym",
            "first_name": "Robert",
            "description": "Born in New-York!",
            "likes_number": 3434,
        }
        artist_view = reverse("artists:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.patch(artist_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["pseudonym"], "New pseudonym")
        self.assertEqual(response.data["first_name"], "Robert")
        self.assertEqual(response.data["description"], "Born in New-York!")
        self.assertEqual(response.data["likes_number"], 0)

    def test_delete_artist_successful_authorized(self):
        user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.client.force_login(user)
        artist_view = reverse("artists:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.delete(artist_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_artists_by_full_name(self):
        data = {
            "pseudonym": "RZA",
            "first_name": "Robert Fitzgerald",
            "last_name": "Diggs",
            "image": None,
            "description": "A few words...",
            "likes_number": 0,
            "is_liked": False
        }
        artist_list = reverse("artists:list-create-view")
        response = self.client.get("%s?pseudonym__contains=%s" % (artist_list, "RZA"))
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0], data)

    def test_get_artists_list(self):
        artist_list = reverse("artists:list-create-view")
        response = self.client.get(artist_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 2)

    def test_like_artist_failed_unauthorized(self):
        like_artist = reverse("artists:like-retrieve-view", kwargs={"pk": 1})
        response = self.client.get(like_artist)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'], "Authentication credentials were not provided.")

    def test_like_artist_failed_authorized(self):
        user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.client.force_login(user)
        like_artist = reverse("artists:like-retrieve-view", kwargs={"pk": 1})
        self.client.get(like_artist)
        artist_view = reverse("artists:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.get(artist_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data['likes_number'], 1)
