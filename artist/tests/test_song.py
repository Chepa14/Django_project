from rest_framework.test import APITestCase
from user.models import User
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_401_UNAUTHORIZED,
    HTTP_204_NO_CONTENT,
    HTTP_201_CREATED
)
from django.urls import reverse


class SongTest(APITestCase):
    fixtures = ("artist_fixtures.json", "song_fixtures.json", "user_fixtures.json")

    def test_create_song_failed_unauthorized(self):
        song_list = reverse("artists:songs-list-create-view", kwargs={"artist_id": 1})
        data = {
            "name": "Call me",
            "image": "null",
            "media_file": "null",
            "time_length_sec": 100
        }
        response = self.client.post(song_list, data)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'], 'Authentication credentials were not provided.')

    def test_create_song_successful_authorized(self):
        user = User.objects.get(pk=1)
        self.client.force_login(user)
        song_list = reverse("artists:songs-list-create-view", kwargs={"artist_id": 1})
        data = {
            "name": "Call me",
            "image": "",
            "media_file": "",
            "time_length_sec": 100
        }
        response = self.client.post(song_list, data)
        self.assertEqual(response.status_code, HTTP_201_CREATED)
        data_check = {
            'authors': [
                {
                    'id': 1,
                    'first_name': 'Robert Fitzgerald',
                    'last_name': 'Diggs'
                }
            ],
            "name": "Call me",
            "image": None,
            "media_file": None,
            "time_length_sec": 100
        }
        self.assertEqual(response.data, data_check)

    def test_get_song_successful(self):
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.get(song_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        data = {
            "authors": [
                {
                    "id": 1,
                    "first_name": "Robert Fitzgerald",
                    "last_name": "Diggs"
                }
            ],
            "name": "Call me",
            "image": None,
            "media_file": None,
            "time_length_sec": 100
        }
        self.assertEqual(response.data, data)

    def test_put_song_failed_unauthorized(self):
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.put(song_view, {"name": "Don't call me"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_song_successful_authorized(self):
        user = User.objects.get(pk=1)
        self.client.force_login(user)
        put_data = {
            "name": "Don't call me",
            "authors": [],
            "time_length_sec": 200,
        }
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.patch(song_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["name"], "Don't call me")
        data = {
            "authors": [
                {
                    "id": 1,
                    "first_name": "Robert Fitzgerald",
                    "last_name": "Diggs"
                }
            ],
            "name": "Call me",
            "image": None,
            "media_file": None,
            "time_length_sec": 100
        }
        self.assertEqual(response.data["authors"], data['authors'])
        self.assertEqual(response.data["time_length_sec"], 200)

    def test_delete_song_successful_authorized(self):
        user = User.objects.get(pk=1)
        self.client.force_login(user)
        song_view = reverse("artists:song-retrieve-update-destroy-view", kwargs={"artist_id": 1, "pk": 1})
        response = self.client.delete(song_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_song_by_full_name(self):
        song_list = reverse("artists:songs-list-create-view", kwargs={"artist_id": 1})
        response = self.client.get(f"{song_list}?search={'Call'}")
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        data = {
            "authors": [
                {
                    "id": 1,
                    "first_name": "Robert Fitzgerald",
                    "last_name": "Diggs"
                }
            ],
            "name": "Call me",
            "image": None,
            "media_file": None,
            "time_length_sec": 100
        }
        self.assertEqual(response.data[0], data)

    def test_get_songs_list(self):
        song_list = reverse("artists:songs-list-create-view", kwargs={"artist_id": 1})
        response = self.client.get(song_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
