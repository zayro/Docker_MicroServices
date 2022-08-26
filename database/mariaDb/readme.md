# Configuration

docker-compose up

## Network

docker network create app-network

## Volumen

docker volume create app-data

## Restore|

docker exec -i some-mysql sh -c 'exec mysql -u<user> -p<password> <database>' < /some/path/on/your/host/all-databases.sql

## Backup

docker exec some-mysql sh -c 'exec mysqldump --all-databases -u<user> -p<password> <database>' > /some/path/on/your/host/all-databases.sql


## Get in Container

- docker exec -it <container> bash
- cd /etc/mysql/conf.d
- chown root etc/mysql/conf.d/master.cnf
- chmod 755 etc/mysql/conf.d/master.cnf


## master

- RESET MASTER;
- SHOW BINARY LOGS;
