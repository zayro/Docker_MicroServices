## ejecutar sin construir el proyecto

docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app node npm cache clean --force npm start

## crea la imagen
- docker build -t nodejs-monolithic .

## ejecuta la imagen creada
- docker run -it nodejs-monolithic
- docker run -it -p 4000:3000 nodejs-monolithic
- docker run -it -d nodejs-monolithic

## corre la imagen
docker run --name execute-nodejs-monolithic -it -p 4000:3000 nodejs-monolithic


## eliminar images

docker rmi nodejs-monolithic
docker rmi nodejs-monolito 
docker rmi microservices_monolithic
docker rmi microservices_books
docker rmi microservices_cars
docker rmi microservices_users


docker rmi $(docker images -f "dangling=true" -q)


