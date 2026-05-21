FROM python:3.12.2-alpine as builder
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
LABEL maintainer="Juan Luis Campos Barrera <luiscampos@uaz.edu.mx>" version="3.1.0" date="17-02-2026"

RUN apk update \
    && apk add mariadb-dev \
    && apk add gcc python3-dev musl-dev tzdata \
    && apk cache clean \
    && apk cache purge

#Config time
RUN cp /usr/share/zoneinfo/America/Mexico_City /etc/localtime \
    && echo "America/Mexico_City" >  /etc/timezone

#crear usuario worker
RUN adduser -D worker

# Correr con usuario worker
# USER worker
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
COPY ./requirements.txt /home/worker/requirements.txt

# USER worker
WORKDIR /home/worker
RUN mkdir app
RUN mkdir app/wheels

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /home/worker/app/wheels -r requirements.txt

FROM python:3.12.2-alpine

RUN apk update \
    && apk add py3-mysqlclient gettext \
    && apk cache clean \
    && apk cache purge

#Config localtime
RUN cp /usr/share/zoneinfo/America/Mexico_City /etc/localtime \
    && echo "America/Mexico_City" >  /etc/timezone

RUN mkdir /static
RUN chmod -R 755 /static


RUN adduser -D worker
RUN #addgroup --system worker && adduser --system --group worker
RUN chown -R worker:worker /static
RUN mkdir /wheels
RUN chown -R worker:worker /wheels


# USER worker
WORKDIR /home/worker
RUN mkdir src
WORKDIR /home/worker/src

RUN pip install -U pip

COPY --from=builder /home/worker/app/wheels /wheels
COPY --from=builder /home/worker/requirements.txt .
RUN pip install --no-cache /wheels/*

COPY --chown=worker:worker ./src/. .
CMD ["python","manage.py","collectstatic","--no-input"]

##TODO: Activar el usuario worker en prod
# USER worker

EXPOSE 8000
STOPSIGNAL SIGTERM
CMD ["python","manage.py","runserver","0.0.0.0:8000"]