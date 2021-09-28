from django.db import models


class News(models.Model):

    title = models.TextField()
    image = models.ImageField(upload_to='imgs')
    description = models.TextField()
    date = models.DateTimeField()

    def __str__(self):
        return self.title[:50] + '...'
