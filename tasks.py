from invoke import task
from load_db import load_db


@task(load_db)
def run_local(c):
    c.run("python3 manage.py makemigrations")
    c.run("python3 manage.py migrate")
    c.run("python3 manage.py collectstatic --noinput")
    c.run("python3 manage.py test user")
    c.run("python3 manage.py runserver 0.0.0.0:8000")
