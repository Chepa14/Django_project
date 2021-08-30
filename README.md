# Music site on Django

## Installation
```
$ git clone https://github.com/Chepa14/Django_project.git
$ cd Django_project
$ pip install virtualenv
$ virtualenv venv
$ source venv/bin/activate
$ docker-compose up
```

If error with port occured write following command: ```sudo kill -9 `sudo lsof -t -i:5432``` to clar port for DB.

## Requirements

You must create a file `.env.dev.txt` in main folder and write the following there:
```
SECRET_KEY = 'your's_secret_key'
DEBUG = True
ALLOWED_HOSTS = '*'
```
## Database dump

To create dump you must run server (```docker-compose up```) and than write following command to terminal:
```
docker-compose exec db pg_dump -U postgres django_db > db_dump.sql
```
To import dump write following command to terminal:
```
docker-compose exec pg_dump -U postgres django_db < db_dump.sql
```

