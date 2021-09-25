from django.db import models


class Artist(models.Model):

    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='imgs')
    description = models.TextField()
    welcome_str = models.CharField(max_length=100, default='Hi')

    def __str__(self):
        return self.name
