# Convertir Base de datos a Modelos de Django
- Crear servicio de Base de datos
    - Crear archivo [docker-compose.yaml](./docker-compose.yaml)
    - Crear [servicio](#servicio-de-base-de-datos) de Base de datos
    - Crear [archivo](./.env) para variables de entorno virtual
    - [Correr](#levantar-servicio-de-bd) servicio de Base de datos
- Crear servicio de Django
    - Crear servicio de [django](#servicio-django) en el docker-compose.yaml
    - Crear [Dockerfile](./Dockerfile) para construir nuestro contenedor con django
    - [Inyectar](#servicio-django) las variables de entorno 
    - [Conectar](#conectar-django-db) django con la base de datos
    - [Migrar](#migrando-modelos-de-django) la base de datos de django
    - [Convertir](#convertir-base-de-datos-a-modelos-de-django) Base de datos a models de django



## Servicio de Base de datos

```yaml
# docker-compose.yaml
services: 
    db-controlcaseta:
        image: mariadb:10.6
        container_name: db-controlcaseta
        env_file: .env
        volumes:
            - ./Datos:/var/lib/mysql
            - ./respaldos:/tmp/respaldos
        working_dir: /tmp/respaldos
        ports:
            - 3306:3306
        restart: unless-stopped
```

## Levantar servicio de BD
```bash
    docker compose up -d
```

## Servicio Django
```yaml
#docker-compose.yaml
  app-controlcaseta:
    image: juanluiscb/controlcaseta:dev-0.0.1
    container_name: app-controlcaseta
    build: .
    expose: 
      - 8000
    ports:
      - 8000:8000
    ## inyectar variables de entorno
    env_file: .env 
    volumes:
      - ./src:/src
```

## Conectar django-db
```python
#../settings.py
from os import environ as env

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': env['MYSQL_DATABASE'],
        'USER': env['MYSQL_USER'],
        'PASSWORD': env['MYSQL_PASSWORD'],
        'HOST': env['MYSQL_HOST'],  # Or an IP Address that your database is hosted on
        'PORT': env['MYSQL_PORT'],
        # optional:
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    }
}
````

## Migrando modelos de django

```bash
    # entrando al contenedor de la DB
    docker compose exec db-controlcaseta bash
```
## Convertir DB a Modelos de django
```bash
    #entrando al contenedor de django
    docker compose exec app-controlcaseta bash
    #migrando la db a modelos de django
    python manage.py inspectdb > CasetaControl/models.py
```