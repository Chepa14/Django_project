from invoke import task
from clean_db import clean_db


@task(clean_db)
def load_db(c):
    # c.run("python3 manage.py dbshell < db_dump.sql")
    ...
