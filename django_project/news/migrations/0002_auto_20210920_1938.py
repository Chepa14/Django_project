# Generated by Django 3.2.6 on 2021-09-20 19:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='news',
            old_name='desc',
            new_name='description',
        ),
        migrations.RenameField(
            model_name='news',
            old_name='img',
            new_name='image',
        ),
    ]
