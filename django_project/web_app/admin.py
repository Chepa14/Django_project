from django.contrib import admin
from .models import Artist, News

# Register your models here.

admin.site.register(Artist)
admin.site.register(News)