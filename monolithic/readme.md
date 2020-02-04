
docker run -p 3000:3000 -it --rm --name my-running-script -v "$PWD":/var/www -w /var/www node npm start

docker run -p 3000:3000 -v $(pwd):/var/www/ -w "/var/www" node npm start

