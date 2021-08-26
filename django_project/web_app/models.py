from django.db import models


# Create your models here.

class Artist(models.Model):
    # добавить текстовое поле с его {именем} (c миграцией)
    name = models.CharField(max_length=200)
    img = models.ImageField(upload_to='imgs')
    desc = models.TextField()


class News(models.Model):

    title = models.TextField()
    img = models.ImageField(upload_to='imgs')
    desc = models.TextField()
    date = models.DateTimeField()
