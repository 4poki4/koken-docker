* git clone https://github.com/4poki4/koken-docker && cd koken-docker && rm -rf .git
* mkdir html logs dbdata
* touch logs/access.log && chmod 666 logs/access.log

* define these variables:
*      $DB_ROOT_PASSWORD
*      $DB_DATABASE
*      $DB_USER
*      $DB_USER_PASSWORD

* curl https://s3.amazonaws.com/koken-installer/releases/Koken_Installer.zip --output html/1.zip && unzip html/1.zip -d html/ #test
* chmod -R 777 html/koken
* apt-get update && apt install apache2-utils -y && htpasswd koken/config/.htpasswd www
* docker-compose up -d --build

