FROM python:3.8.5

RUN mkdir /code

COPY requirements.txt /code

RUN pip3 install -r /code/requirements.txt

COPY . /code

WORKDIR /code

RUN  python manage.py collectstatic

RUN DJANGO_SUPERUSER_PASSWORD=admin python manage.py createsuperuser --noinput admin

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000