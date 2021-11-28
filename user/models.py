from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    avatar = models.ImageField(upload_to='imgs', blank=True)
    about_me = models.TextField(max_length=200, blank=True)
