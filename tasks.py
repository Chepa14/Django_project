from invoke import task


@task
def build(c):
    c.run(
        "PGPASSWORD=postgres dropdb -h db -U postgres -W django_db &&"
        "PGPASSWORD=postgres createdb -h db -U postgres django_db &&"
        "python3 ./django_project/manage.py dbshell < db_dump.sql"
    )
