from invoke import task


@task
def run_local(c):
    c.run("python3 manage.py dbshell < clear_db.sql")
    c.run("python3 manage.py dbshell < db_dump.sql")
    c.run("python3 manage.py makemigrations")
    c.run("python3 manage.py migrate --noinput")
    c.run("python3 manage.py collectstatic --noinput")
    c.run("python3 manage.py test user")
    c.run("python3 manage.py runserver 0.0.0.0:8000")
