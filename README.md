# Music site on Django

## Installation
```
$ git clone https://github.com/Chepa14/Django_project.git
$ cd Django_project
$ docker-compose up
```

If error with port occured write following command: ```sudo kill 9 `sudo lsof -t -i:5432` ``` to clear port for DB.

## Requirements

You must create a file `.env.dev.txt` in main folder and write the following there:
```
SECRET_KEY = 'your's secret key'
DEBUG = True
ALLOWED_HOSTS = '*'

SENDGRID_API_KEY = 'sendgrid api key'

DB_USERNAME = 'db username (default - postgres)'
DB_PASSWORD = 'db password (default - postgres)'
DB_NAME = 'db name (default - django_db)'
DB_HOST = 'db host (default - db)'
DB_PORT = 'db port (default - 5432)'

EMAIL = 'email host'

SPOTIFY_CLIENT_ID = 'Spotify Client ID'
SPOTIFY_CLIENT_SECRET = 'Spotify Client Secret'
```
Also you must create a file `.env` file in **/frontend** folder and write the following there:
```
REACT_APP_SPOTIFY_CLIENT_ID = 'Spotify Client ID'
```

## Database dump

To create dump you must run server (```docker-compose up```) and than write following command to terminal:
```
$ PGPASSWORD="your's_password" docker exec -i django_project_db_1  pg_dump --no-owner -U <User name> <DB Name> > db_dump.sql
```
To import dump write following command to terminal:
```
$ invoke run-local
```
## Run tests

Tests cover all objects and are run by the following command: 
```
$ docker-compose exec django python manage.py test
```
