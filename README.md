Requirements: docker, docker-compose

* git clone https://github.com/4poki4/koken-docker && cd koken-docker && rm -rf .git && sudo bash finish-installation.sh **username**

for use without authentification comment these lines
    - auth_basic "Auth";
    - auth_basic_user_file /var/www/.htpasswd;
in ./config/nginx.conf
