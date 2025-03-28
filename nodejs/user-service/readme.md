# build container
docker build -t zayro/user-service .

# execute container

- port righ it's into server
- port left it's into local
docker run -p 5000:5000 -d zayro/user-service


# delete image about container

- docker rmi -f zayro/user-service