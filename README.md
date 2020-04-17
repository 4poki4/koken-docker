Requirements: 
```
docker
docker-compose
```

Install:
```
git clone https://github.com/4poki4/koken-docker && \
    cd koken-docker && \
    sudo bash finish-installation.sh username
```

After installation you will see credentials for access to database in docker-compose.yml

For use without authentification comment these lines in ./config/nginx.conf
```
    auth_basic "Auth";
    auth_basic_user_file /var/www/.htpasswd;
```

