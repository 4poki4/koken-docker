* git clone https://github.com/4poki4/koken-docker && cd koken-docker && rm -rf .git
* mkdir html logs dbdata
* touch logs/access.log && chmod 666 logs/access.log

* define these variables:
*      $DB_ROOT_PASSWORD
*      $DB_DATABASE
*      $DB_USER
*      $DB_USER_PASSWORD

* docker-compose up -d --build

