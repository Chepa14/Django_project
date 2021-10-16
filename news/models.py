from django.db import models
from artist.models import Artist
from user.models import User
import os


def get_news_upload_path(instance, filename):
    return os.path.join(
        'news',
        instance.date.strftime("%Y-%m-%d"),
        filename
    )


class News(models.Model):
    title = models.TextField(max_length=150)
    image = models.ImageField(upload_to=get_news_upload_path, null=True, blank=True)
    description = models.TextField(blank=True)
    create_datetime = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_datetime = models.DateTimeField(auto_now=True, blank=True, null=True)
    tags = models.ManyToManyField(Artist, default=[None], blank=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, default=None)

    def __str__(self):
        return self.title[:30] + '...'


class Comment(models.Model):
    news = models.ForeignKey(News, on_delete=models.CASCADE, related_name='comments')
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('created_at',)

    def __str__(self):
        return f"{self.author} commented {self.news}"
