from django.db import models


# Create your models here.

class News(models.Model):

    title = models.TextField()
    img = models.ImageField(upload_to='imgs')
    desc = models.TextField()
    date = models.DateTimeField()

    def __str__(self):
        return self.title[:50] + '...'
