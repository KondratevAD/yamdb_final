FROM python:3.8.5

RUN mkdir /code

COPY requirements.txt /code

RUN pip3 install -r /code/requirements.txt

COPY . /code

WORKDIR /code

RUN  python manage.py collectstatic

RUN python manage.py createsuperuser --noinput --username ${{ secrets.DJANGO_SUPERUSER_USERNAME }} --email ${{ secrets.DJANGO_SUPERUSER_EMAIL }} --password ${{ secrets.DJANGO_SUPERUSER_PASSWORD }}

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000