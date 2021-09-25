from invoke import task


@task
def run_local(c): #run_local
    # c.run(
    #     "PGPASSWORD=postgres dropdb -h db -U postgres -W django_db" #add to script
    # )
    # c.run("PGPASSWORD=postgres createdb -h db -U postgres django_db")
    # c.run("python3 ./django_project/manage.py dbshell < db_dump.sql")

    c.run("python3 manage.py makemigrations")  # makemigrations
    c.run("python3 manage.py migrate")    #migrate
    # c.run("python3 ./django_project/manage.py collectstatic")    #collect static
    c.run("python manage.py runserver 0.0.0.0:8000")    # runserver
