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
    image = models.ImageField(upload_to=get_artist_upload_path, null=True, blank=True)
    description = models.TextField(blank=True)
    likes = models.ManyToManyField(User, default=[None], blank=True)
    likes_number = models.IntegerField(default=0, blank=True)

    def __str__(self):
        return self.pseudonym


class Song(models.Model):
    name = models.CharField(max_length=30)
    authors = models.ManyToManyField(Artist, default=[None], blank=True)
    image = models.ImageField(upload_to=get_song_upload_path, null=True, blank=True)
    media_file = models.FileField(upload_to=get_song_upload_path, null=True, blank=True)
    time_length_sec = models.IntegerField(default=0, blank=True)

    def __str__(self):
        return self.name
