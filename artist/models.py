from django.db import models
import os


def get_song_upload_path(instance, filename):
    print(instance)
    return os.path.join(
        instance.author.pseudonym,
        instance.file_path,
        filename
    )


def get_artist_upload_path(instance, filename):
    print(instance)
    return os.path.join(
        instance.pseudonym,
        instance.file_path,
        filename
    )


class Artist(models.Model):
    pseudonym = models.CharField(max_length=20, default='')
    first_name = models.CharField(max_length=20, default='', blank=True)
    last_name = models.CharField(max_length=30, default='', blank=True)
    image = models.ImageField(upload_to=get_artist_upload_path, blank=True)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.pseudonym


class Song(models.Model):
    name = models.CharField(max_length=30)
    author = models.ManyToManyField(Artist, default=[None], blank=True)
    image = models.ImageField(upload_to=get_song_upload_path, default=None, blank=True)
    time_length_sec = models.IntegerField(default=0, blank=True)

    def __str__(self):
        return self.name
