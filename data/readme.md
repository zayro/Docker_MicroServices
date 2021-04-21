docker-compose up

## Restore

docker exec -i some-mysql sh -c 'exec mysql -u<user> -p<password> <database>' < /some/path/on/your/host/all-databases.sql

## Backup

docker exec some-mysql sh -c 'exec mysqldump --all-databases -u<user> -p<password> <database>' > /some/path/on/your/host/all-databases.sql
