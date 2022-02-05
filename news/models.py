from django.utils.crypto import get_random_string
from artist.models import Artist
from django.db import models
from user.models import User
import datetime
import os


def get_news_upload_path(_, filename):
    return os.path.join(
        'news',
        datetime.datetime.now().strftime("%Y-%m-%d"),
        f'{get_random_string(20)}.{filename.split(".")[1]}'
    )


class News(models.Model):
    title = models.TextField(max_length=150)
    image = models.ImageField(upload_to=get_news_upload_path, null=True, blank=True)
    description = models.TextField(blank=True)
    create_datetime = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_datetime = models.DateTimeField(auto_now=True, blank=True, null=True)
    tags = models.ManyToManyField(Artist, default=[None], blank=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.title[:30] + '...'


class Comment(models.Model):
    news = models.ForeignKey(News, on_delete=models.CASCADE, related_name='comments')
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    create_datetime = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('create_datetime',)

    def __str__(self):
        return f"{self.author} commented {self.news}"
