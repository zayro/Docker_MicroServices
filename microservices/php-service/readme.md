# build container
docker build -t zayro/php-service .

# execute container

docker run -d zayro/php-service


# delete image about container

- docker rmi -f zayro/php-service