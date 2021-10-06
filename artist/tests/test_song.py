from rest_framework.test import APITestCase
from artist.models import Song
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
        self.user = User.objects.create_user("Tester", "test@mail.com", "123456789")
        self.song = Song.objects.get(pk=1)
        self.song_view = reverse("artist-song", kwargs={"artist_id": 1, "song_id": self.song.id})
        self.songs_filtered = reverse(
            "artist-songs-filtered-by-name", kwargs={"artist_id": 1, "search_name": "Call"}
        )
        self.song_list = reverse("artist-songs-list", kwargs={"artist_id": 1})
        self.data = {
          "author": [
              {
                  "pseudonym": "RZA",
                  "first_name": "Robert Fitzgerald",
                  "last_name": "Diggs",
                  "image": None,
                  "description": "A few words...",
                  "likes": [],
                  "likes_number": 0
              }
          ],
          "name": "Call me",
          "image": None,
          "media_file": None,
          "time_length_sec": 100
        }

    def test_get_song_successful(self):
        response = self.client.get(self.song_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, self.data)

    def test_put_song_failed_unauthorized(self):
        response = self.client.put(self.song_view, {"name": "Don't call me"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_song_successful_authorized(self):
        self.client.force_login(self.user)
        put_data = {
            "name": "Don't call me",
            "author": [],
            "time_length_sec": 200,
        }
        response = self.client.patch(self.song_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["name"], "Don't call me")
        self.assertEqual(response.data["author"], self.data['author'])
        self.assertEqual(response.data["time_length_sec"], 200)

    def test_delete_song_successful_authorized(self):
        self.client.force_login(self.user)
        response = self.client.delete(self.song_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_song_by_full_name(self):
        response = self.client.get(self.songs_filtered)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0], self.data)

    def test_get_artists_list(self):
        response = self.client.get(self.song_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
