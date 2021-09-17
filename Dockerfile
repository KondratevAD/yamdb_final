FROM python:3.8.5

RUN mkdir /code

RUN mkdir code/static

RUN mkdir code/media

COPY requirements.txt /code

RUN pip3 install -r /code/requirements.txt

COPY . /code

WORKDIR /code

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000