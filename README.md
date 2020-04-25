Requirements: 
```
docker
docker-compose
```

Install:
```
Ubuntu:
git clone https://github.com/4poki4/koken-docker && \
    cd koken-docker && \
    sudo bash finish-installation.sh username

Other:
git clone https://github.com/4poki4/koken-docker && cd koken-docker
#Install apache2-utils and pwgen
#Remove "apt-get update && apt-get install apache2-utils pwgen" from finish-installation.sh
sudo bash finish-installation.sh username
```

After installation you will see credentials for access to database in docker-compose.yml
