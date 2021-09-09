from django.db import models


# Create your models here.

class Artist(models.Model):
    # добавить текстовое поле с его {именем} (c миграцией)
    name = models.CharField(max_length=100)
    img = models.ImageField(upload_to='imgs')
    desc = models.TextField()
    welcome_str = models.CharField(max_length=100, default='Hi')

    def __str__(self):
        return self.name

class News(models.Model):

    title = models.TextField()
    img = models.ImageField(upload_to='imgs')
    desc = models.TextField()
    date = models.DateTimeField()

    def __str__(self):
        return self.title[:50] + '...'