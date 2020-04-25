version: '2'

services:

  mysql:
    image: nimmis/alpine-mariadb
    ports:
      - 3306:3306
    environment:
      MARIADB_ALLOW_EMPTY_PASSWORD=no
      MARIADB_RANDOM_ROOT_PASSWORD=no
      MARIADB_REMOTE_ROOT=no
      MARIADB_ROOT_PASSWORD: $DB_ROOT_PASSWORD
      MARIADB_DATABASE: $DB_DATABASE
      MARIADB_USER: $DB_USER
      MARIADB_PASSWORD: $DB_USER_PASSWORD
    volumes:
      - ./mysql/db:/data/db
      - ./mysql/conf:/data/conf
      - ./mysql/logs:/data/logs

  koken:
    build: koken
    ports:
      - 80:80
      - 443:443
      - 1935:1935
    volumes:
      - ./html:/var/www/html
      - ./koken/config/.htpasswd:/var/www/.htpasswd
      - ./koken/config/mime.types:/etc/nginx/mime.types
      - ./koken/config/nginx.conf:/etc/nginx/nginx.conf
      - ./logs/nginx-access.log:/var/log/nginx-access.log
      - ./logs/nginx-error.log:/var/log/nginx-error.log

