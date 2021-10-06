from rest_framework.test import APITestCase
from artist.models import Artist
from user.models import User
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_401_UNAUTHORIZED,
    HTTP_204_NO_CONTENT,
)
from django.urls import reverse


class ArtistTest(APITestCase):
    fixtures = ("artist_fixtures.json",)

    def setUp(self) -> None:
        self.user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.artist = Artist.objects.get(pk=1)
        self.artist_view = reverse("artist", kwargs={"id": self.artist.id})
        self.artists_filtered = reverse(
            "artists-filtered-by-name", kwargs={"full_name": "RZA"}
        )
        self.artist_list = reverse("artist-list")
        self.like_artist = reverse("like-artist", kwargs={"id": self.artist.id})

    def test_get_artist_successful(self):
        response = self.client.get(self.artist_view)
        data = {
            "pseudonym": "RZA",
            "first_name": "Robert Fitzgerald",
            "last_name": "Diggs",
            "image": None,
            "description": "A few words...",
            "likes": [],
            "likes_number": 0,
        }
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, data)

    def test_put_artist_failed_unauthorized(self):
        response = self.client.put(self.artist_view, {"first_name": "Robert"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_artist_successful_authorized(self):
        self.client.force_login(self.user)
        put_data = {
            "pseudonym": "New pseudonym",
            "first_name": "Robert",
            "description": "Born in New-York!",
            "likes_number": 3434,
        }
        response = self.client.patch(self.artist_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["pseudonym"], "New pseudonym")
        self.assertEqual(response.data["first_name"], "Robert")
        self.assertEqual(response.data["description"], "Born in New-York!")
        self.assertEqual(response.data["likes_number"], 0)

    def test_delete_artist_successful_authorized(self):
        self.client.force_login(self.user)
        response = self.client.delete(self.artist_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_artists_by_full_name(self):
        data = {
            "pseudonym": "RZA",
            "first_name": "Robert Fitzgerald",
            "last_name": "Diggs",
            "image": None,
            "description": "A few words...",
            "likes": [],
            "likes_number": 0,
        }
        response = self.client.get(self.artists_filtered)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0], data)

    def test_get_artists_list(self):
        response = self.client.get(self.artist_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 2)

    def test_like_artist_failed_unauthorized(self):
        response = self.client.get(self.like_artist)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'], "Authentication credentials were not provided.")

    def test_like_artist_failed_authorized(self):
        self.client.force_login(self.user)
        self.client.get(self.like_artist)
        response = self.client.get(self.artist_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data['likes']), 1)
        self.assertEqual(response.data['likes_number'], 1)
