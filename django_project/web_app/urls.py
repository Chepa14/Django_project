from django.urls import path
from . import views

# URLConf
urlpatterns = [
    path('', views.home, name='home'),
    # path('add', views.add, name='add')
]
