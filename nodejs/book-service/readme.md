docker build  -t zayro/book-service .

docker run -p 3000:3000 -d zayro/book-service

# delete image

- docker rmi -f zayro/book-service
- docker compose down --rmi all
- docker compose build --no-cache
- docker compose up --remove-orphans
- docker compose up --build --no-cache --remove-orphans