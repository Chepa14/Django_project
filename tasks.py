from invoke import task


@task
def build(c): #run_local
    c.run(
        "PGPASSWORD=postgres dropdb -h db -U postgres -W django_db &&" #add to script
        "PGPASSWORD=postgres createdb -h db -U postgres django_db &&"
        "python3 ./django_project/manage.py dbshell < db_dump.sql"

        # "python3 ./django_project/manage.py migrate web_app"
        # collect static
    )
    # runserver
