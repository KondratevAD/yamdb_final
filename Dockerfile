FROM python:3.8.5

RUN mkdir /code

COPY requirements.txt /code

RUN pip3 install -r /code/requirements.txt

COPY . /code

WORKDIR /code

RUN  python manage.py collectstatic

DJANGO_SUPERUSER_EMAIL=admin@admin.com
export DJANGO_SUPERUSER_EMAIL

DJANGO_SUPERUSER_USERNAME=admin
export DJANGO_SUPERUSER_USERNAME

DJANGO_SUPERUSER_PASSWORD=admin
export DJANGO_SUPERUSER_PASSWORD

RUN manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL --password $DJANGO_SUPERUSER_PASSWORD

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000