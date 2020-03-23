# build container
docker build -t zayro/php-service .

# execute container

docker run -it -p 61:60 -d zayro/php-service  php -S 0.0.0.0:60 -t public

# delete image about container

- docker rmi -f zayro/php-service