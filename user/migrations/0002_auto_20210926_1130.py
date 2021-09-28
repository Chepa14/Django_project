# Generated by Django 3.2.6 on 2021-09-26 11:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='about_me',
            field=models.TextField(blank=True, max_length=200),
        ),
        migrations.AlterField(
            model_name='user',
            name='avatar',
            field=models.ImageField(blank=True, upload_to='imgs'),
        ),
    ]
