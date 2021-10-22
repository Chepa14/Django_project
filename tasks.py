from invoke import task


@task
def run_local(c):
    c.run("python manage.py dbshell < clear_db.sql")
    c.run("python manage.py dbshell < db_dump.sql")
    c.run("python manage.py makemigrations")
    c.run("python manage.py migrate --noinput")
    c.run("python manage.py collectstatic --noinput")
    c.run("python manage.py runserver 0.0.0.0:8000")
