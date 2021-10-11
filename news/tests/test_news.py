from rest_framework.test import APITestCase
from user.models import User
from news.models import News
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_401_UNAUTHORIZED,
    HTTP_204_NO_CONTENT,
)
from django.urls import reverse


class NewsTest(APITestCase):
    fixtures = ("news_fixtures.json", "user_fixtures.json")

    def setUp(self) -> None:
        self.user = User.objects.get(pk=1)
        self.news = News.objects.get(pk=1)
        self.news_view = reverse("news", kwargs={"id": self.news.id})
        self.news_filtered = reverse(
            "filtered-news", kwargs={"search_name": "album"}
        )
        self.news_list = reverse("news-list")
        self.comment_news = reverse("comment-news", kwargs={"id": self.news.id})

    def test_get_news_successful(self):
        response = self.client.get(self.news_view)
        data = {
            "title": "Release of album by Artist",
            "image": None,
            "description": "A few words about this news...",
            "create_datetime": "2021-10-08T15:21:51.735015Z",
            "update_datetime": "2021-10-08T15:21:51.735015Z",
            "tags": [],
            "author":
                {
                    "username": "User14",
                    "first_name": "Ivan",
                    "last_name": "",
                    "email": "i.chepets@mail.com",
                    "avatar": None,
                    "about_me": "",
                },
            "comments": []
        }
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, data)

    def test_put_news_failed_unauthorized(self):
        response = self.client.put(self.news_view, {"title": "Some interesting title"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_news_successful_authorized(self):
        self.client.force_login(self.user)
        put_data = {
            "title": "Some interesting title",
            "description": "Something interesting...",
            "author": []
        }
        author = \
            {
                "username": "User14",
                "first_name": "Ivan",
                "last_name": "",
                "email": "i.chepets@mail.com",
                "avatar": None,
                "about_me": "",
            }
        response = self.client.patch(self.news_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["title"], "Some interesting title")
        self.assertEqual(response.data["description"], "Something interesting...")
        self.assertEqual(response.data["author"], author)

    def test_delete_news_successful_authorized(self):
        self.client.force_login(self.user)
        response = self.client.delete(self.news_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_news_by_search_name(self):
        data = {
            "title": "Release of album by Artist",
            "image": None,
            "description": "A few words about this news...",
            "create_datetime": "2021-10-08T15:21:51.735015Z",
            "update_datetime": "2021-10-08T15:21:51.735015Z",
            "tags": [],
            "author":
                {
                    "username": "User14",
                    "first_name": "Ivan",
                    "last_name": "",
                    "email": "i.chepets@mail.com",
                    "avatar": None,
                    "about_me": "",
                },
            "comments": []
        }
        response = self.client.get(self.news_filtered)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0], data)

    def test_get_news_list(self):
        response = self.client.get(self.news_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_comment_news_failed_unauthorized(self):
        post_data = {
            "news": "null",
            "author": "null",
            "text": "New comment to news!",
            "created_on": "null"
        }
        response = self.client.post(self.comment_news, post_data)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'], "Authentication credentials were not provided.")

    def test_comment_news_successful_authorized(self):
        self.client.force_login(self.user)
        post_data = {
            "news": "null",
            "author": "null",
            "text": "New comment to news!",
            "created_on": "null"
        }
        self.client.post(self.comment_news, post_data)
        response = self.client.get(self.news_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data['comments']), 1)
        self.assertEqual(response.data['comments'][0]['text'], "New comment to news!")
