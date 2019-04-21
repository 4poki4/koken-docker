#!/bin/bash

mkdir html logs dbdata || exit 1
touch logs/access.log && chmod 666 logs/access.log || exit 1
wget https://s3.amazonaws.com/koken-installer/releases/Koken_Installer.zip -O Koken_Installer.zip || exit 1
unzip Koken_Installer.zip -d html/ && rm Koken_Installer.zip || exit 1
mv html/koken/index.php html/koken/index1.php && cat html/koken/index1.php | sed "s/loopback\['fail'\]/loopback\['true'\]/g" > html/koken/index.php && rm html/koken/index1.php  || exit 1
chmod -R 777 html/koken || exit 1
apt-get update && apt install apache2-utils pwgen -y && htpasswd koken/config/.htpasswd $1 || exit 1
MYSQL_ROOT_PASSWORD=`pwgen -1`
MYSQL_DATABASE=koken_db_`pwgen -1`
MYSQL_USER=koken_db_user_`pwgen -1`
MYSQL_PASSWORD=`pwgen -1`
docker-compose up -d --build || exit 1
bash -c 'sleep 1 && rm finish-installation.sh || exit 1' &

