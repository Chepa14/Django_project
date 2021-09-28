from invoke import task


@task
def clean_db(c):
    # c.run(
    #     "PGPASSWORD=postgres dropdb -h db -U postgres -W django_db"
    # )
    # c.run("PGPASSWORD=postgres createdb -h db -U postgres django_db")
    ...
