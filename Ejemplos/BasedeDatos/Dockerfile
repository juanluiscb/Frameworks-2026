FROM python:3.12.13-slim

RUN apt update
RUN apt install -y python3-dev default-libmysqlclient-dev build-essential pkg-config

RUN export MYSQLCLIENT_CFLAGS=`pkg-config mysqlclient --cflags`
RUN export MYSQLCLIENT_LDFLAGS=`pkg-config mysqlclient --libs`

RUN mkdir /src
WORKDIR /src

COPY ./requirements.txt .
RUN pip install -U pip

RUN pip install -r requirements.txt

COPY ./src/. .

EXPOSE 8000


CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]