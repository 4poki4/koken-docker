version: '2'

services:

  mysql:
    image: mysql:5.7
    ports:
      - 3306:3306
    environment:
      MYSQL_ROOT_PASSWORD: $DB_ROOT_PASSWORD
      MYSQL_DATABASE: $DB_DATABASE
      MYSQL_USER: $DB_USER
      MYSQL_PASSWORD: $DB_USER_PASSWORD
    volumes:
      - ./mysql/db:/var/lib/mysql
      - ./mysql/conf/mysql-minimal.cnf:/etc/mysql/conf.d/mysql-minimal.cnf

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

