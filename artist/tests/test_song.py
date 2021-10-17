from rest_framework.test import APITestCase
from user.models import User
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_401_UNAUTHORIZED,
    HTTP_204_NO_CONTENT,
)
from django.urls import reverse


class SongTest(APITestCase):
    fixtures = ("artist_fixtures.json", "song_fixtures.json")

    def setUp(self) -> None:
        self.data = {
          "author": [1],
          "name": "Call me",
          "image": None,
          "media_file": None,
          "time_length_sec": 100
        }

    def test_get_song_successful(self):
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.get(song_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, self.data)

    def test_put_song_failed_unauthorized(self):
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.put(song_view, {"name": "Don't call me"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_song_successful_authorized(self):
        user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.client.force_login(user)
        put_data = {
            "name": "Don't call me",
            "author": [],
            "time_length_sec": 200,
        }
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.patch(song_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["name"], "Don't call me")
        self.assertEqual(response.data["author"], self.data['author'])
        self.assertEqual(response.data["time_length_sec"], 200)

    def test_delete_song_successful_authorized(self):
        user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.client.force_login(user)
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.delete(song_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_song_by_full_name(self):
        song_list = reverse("artists:songs-list-create-view", kwargs={"artist_id": 1})
        response = self.client.get("%s?author__pseudonym__contains=%s" % (song_list, "Call"))
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0], self.data)

    def test_get_artists_list(self):
        song_list = reverse("artists:songs-list-create-view", kwargs={"artist_id": 1})
        response = self.client.get(song_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
