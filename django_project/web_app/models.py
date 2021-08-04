from django.db import models


# Create your models here.

class Artist:
    id: int
    name: str
    img: str
    desc: str

    def __init__(self, id, name, img, desc):
        self.id = id
        self.name = name
        self.img = img
        self.desc = desc


class News:
    id: int
    title: str
    img: str
    desc: str
    date: str

    def __init__(self, id, title, img, desc, date):
        self.id = id
        self.title = title
        self.img = img
        self.desc = desc
        self.date = date
