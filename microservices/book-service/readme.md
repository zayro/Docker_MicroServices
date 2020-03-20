docker build  -t zayro/book-service .

docker run -p 3000:3000 -d zayro/book-service

# delete image

- docker rmi -f zayro/book-service