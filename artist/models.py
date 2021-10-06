from django.db import models
from user.models import User
import os


def get_song_upload_path(instance, filename):
    return os.path.join(
        'songs',
        instance.name,
        filename
    )


def get_artist_upload_path(instance, filename):
    return os.path.join(
        'artists',
        instance.pseudonym,
        filename
    )


class Artist(models.Model):
    pseudonym = models.CharField(max_length=20, default='')
    first_name = models.CharField(max_length=20, default='', blank=True)
    last_name = models.CharField(max_length=30, default='', blank=True)
    image = models.ImageField(upload_to=get_artist_upload_path, blank=True)
    description = models.TextField(blank=True)
    likes = models.ManyToManyField(User, default=[None], blank=True)
    likes_number = models.IntegerField(default=0, blank=True)

    def __str__(self):
        return self.pseudonym

    @property
    def number_of_likes(self):
        return self.likes.all().count()

    @number_of_likes.setter
    def number_of_likes(self, value):
        self.likes_number = value

    @property
    def full_name(self):
        return f"{self.first_name} {self.last_name}"


class Song(models.Model):
    name = models.CharField(max_length=30)
    author = models.ManyToManyField(Artist, default=[None], blank=True)
    image = models.ImageField(upload_to=get_song_upload_path, default=None, blank=True)
    media_file = models.FileField(upload_to=get_song_upload_path, default=None, blank=True)
    time_length_sec = models.IntegerField(default=0, blank=True)

    def __str__(self):
        return self.name
