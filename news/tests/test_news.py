from rest_framework.test import APITestCase
from user.models import User
from rest_framework.status import (
    HTTP_200_OK,
    HTTP_201_CREATED,
    HTTP_401_UNAUTHORIZED,
    HTTP_204_NO_CONTENT,
    HTTP_403_FORBIDDEN
)
from django.urls import reverse


class NewsTest(APITestCase):
    fixtures = ("news_fixtures.json", "user_fixtures.json", "comment_fixtures")

    def setUp(self) -> None:
        self.news_list = reverse("news:list-create-view")

    def test_get_news_successful(self):
        self.news_view = reverse("news:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.get(self.news_view)
        data = {
            "id": 1,
            "title": "Release of album by Artist",
            "image": None,
            "description": "A few words about this news...",
            "create_datetime": "2021-10-08",
            "update_datetime": "2021-10-08T15:21:51.735015Z",
            "tags": [],
            "author": {
                'id': 1,
                'username': 'User14',
                'avatar': None
            },
            "last_comment": {
                'text': 'Description of news',
                "author": {
                    'id': 1,
                    'username': 'User14',
                    'avatar': None
                },
                'create_datetime': '2021-10-09T15:21:51.735015Z'
            }
        }
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data, data)

    def test_create_news_successful(self):
        self.user = User.objects.get(pk=1)
        self.client.force_login(self.user)
        post_data = {
            'title': 'Testing news creation!',
            'author': 1
        }
        author = {
            'id': 1,
            'username': 'User14',
            'avatar': None
        }
        response = self.client.post(self.news_list, post_data)
        self.assertEqual(response.status_code, HTTP_201_CREATED)
        self.assertEqual(response.data['title'], post_data['title'])
        self.assertEqual(response.data['author'], author)

    def test_create_news_failed_unauthorized(self):
        post_data = {
            'title': 'Testing news creation!',
            'author': 1
        }
        response = self.client.post(self.news_list, post_data)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)

    def test_put_news_failed_unauthorized(self):
        self.news_view = reverse("news:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.put(self.news_view, {"title": "Some interesting title"})
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(
            response.data["detail"], "Authentication credentials were not provided."
        )

    def test_put_news_failed_not_author(self):
        self.user = User.objects.get(pk=2)
        self.client.force_login(self.user)
        self.news_view = reverse("news:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.put(self.news_view, {"title": "Some interesting title"})
        self.assertEqual(response.status_code, HTTP_403_FORBIDDEN)
        self.assertEqual(
            response.data["detail"], "You do not have permission to perform this action."
        )

    def test_put_news_successful_authorized(self):
        self.user = User.objects.get(pk=1)
        self.client.force_login(self.user)
        put_data = {
            "title": "Some interesting title",
            "description": "Something interesting..."
        }
        author = {
            'id': 1,
            'username': 'User14',
            'avatar': None
        }
        self.news_view = reverse("news:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.patch(self.news_view, put_data)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(response.data["title"], "Some interesting title")
        self.assertEqual(response.data["description"], "Something interesting...")
        self.assertEqual(response.data["author"], author)

    def test_delete_news_failed_not_author(self):
        self.user = User.objects.get(pk=2)
        self.client.force_login(self.user)
        self.news_view = reverse("news:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.delete(self.news_view)
        self.assertEqual(response.status_code, HTTP_403_FORBIDDEN)

    def test_delete_news_successful_authorized(self):
        self.user = User.objects.get(pk=1)
        self.client.force_login(self.user)
        self.news_view = reverse("news:retrieve-update-destroy-view", kwargs={"pk": 1})
        response = self.client.delete(self.news_view)
        self.assertEqual(response.status_code, HTTP_204_NO_CONTENT)

    def test_get_news_by_search_name(self):
        data = {
            "id": 1,
            "title": "Release of album by Artist",
            "image": None,
            "description": "A few words about this news...",
            "create_datetime": "2021-10-08",
            "update_datetime": "2021-10-08T15:21:51.735015Z",
            "tags": [],
            "author": {
                'id': 1,
                'username': 'User14',
                'avatar': None
            },
            "last_comment": {
                'text': 'Description of news',
                "author": {
                    'id': 1,
                    'username': 'User14',
                    'avatar': None
                },
                'create_datetime': '2021-10-09T15:21:51.735015Z'
            }
        }
        self.news_filtered = reverse("news:list-create-view")
        response = self.client.get(f"{self.news_filtered}?search=album")
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0], data)

    def test_get_news_list(self):
        response = self.client.get(self.news_list)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 2)

    def test_get_comments_list(self):
        self.comments_news = reverse("news:comments-list-create", kwargs={"pk": 1})
        response = self.client.get(self.comments_news)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_comment_news_failed_unauthorized(self):
        post_data = {
            "text": "New comment to news!"
        }
        self.comment_news = reverse("news:comments-list-create", kwargs={"pk": 1})
        response = self.client.post(self.comment_news, post_data)
        self.assertEqual(response.status_code, HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'], "Authentication credentials were not provided.")

    def test_comment_news_successful_authorized(self):
        self.user = User.objects.get(pk=1)
        self.client.force_login(self.user)
        post_data = {
            "author": 1,
            "text": "New comment to news!"
        }
        self.comment_news = reverse("news:comments-list-create", kwargs={"pk": 1})
        self.client.post(self.comment_news, post_data)
        self.comments_view = reverse("news:comments-list-create", kwargs={"pk": 1})
        response = self.client.get(self.comments_view)
        self.assertEqual(response.status_code, HTTP_200_OK)
        self.assertEqual(len(response.data), 2)
        self.assertEqual(response.data[-1]['text'], "New comment to news!")

        # TODO create news successfully
