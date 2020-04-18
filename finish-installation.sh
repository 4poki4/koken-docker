#!/bin/bash

mkdir html logs dbdata || exit 1
touch logs/access.log && chmod 666 logs/access.log || exit 1
touch logs/nginx-error.log && chmod 666 logs/nginx-error.log || exit 1
wget https://s3.amazonaws.com/koken-installer/releases/Koken_Installer.zip -O Koken_Installer.zip || exit 1
unzip Koken_Installer.zip -d html/ && rm Koken_Installer.zip || exit 1
mv html/koken/index.php html/koken/index1.php && cat html/koken/index1.php | sed "s/loopback\['fail'\]/loopback\['true'\]/g" > html/index.php && rm -rf html/koken || exit 1
chmod -R 777 html || exit 1
apt-get update && apt install apache2-utils pwgen -y && htpasswd koken/config/.htpasswd $1 || exit 1
cat docker-compose.yml.tpl | sed 's/\$DB_ROOT_PASSWORD/'`pwgen -1`'/g' | sed 's/\$DB_DATABASE/koken_db_'`pwgen -1`'/g' | sed 's/\$DB_USER_PASSWORD/'`pwgen -1`'/g' | sed 's/\$DB_USER/koken_'`pwgen -1`'/g' > docker-compose.yml && rm docker-compose.yml.tpl || exit 1
docker-compose up -d --build --force-recreate || exit 1
rm finish-installation.sh || exit 1
echo '      MYSQL_HOST: mysql'
cat docker-compose.yml | grep MYSQL

