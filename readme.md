# MANEJO DOCKER COMPOSE

- sudo curl -L "<https://github.com/docker/compose/releases/download/1.25.3/docker-compose>-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

- sudo chmod +x /usr/local/bin/docker-compose

- sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

- docker-compose --version

## inicializar las composicion de dependecias

- docker-compose up --build
- docker-compose up -d --no-build

### finaliza el proceso del contenedor

- docker-compose up stop client

### Elimina  el proceso del contenedor

- docker-compose up rm client

### levanta el proceso del contenedor

- docker-compose up client --build -d


## instalacion Docker Linux

1. `sudo apt install apt-transport-https ca-certificates curl software-properties-common`
2. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
3. `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"`
4. `apt-cache policy docker-ce`
5. `sudo apt install docker-ce`

## Paso 2 — Ejecutar el comando Docker sin sudo (Opcional)

1. sudo usermod -aG docker ${USER}
2. su - ${USER}
3. se verifica si se agrego el usuario ´id -nG´

listado de imagenes instaladas en Docker

- sudo docker image list

Comandos DockerFile

- sudo apt-get install docker-ce docker-ce-cli containerd.io

ver procesos activos con Docker

- docker ps
- sudo netstat -lntp | grep dockerd

Enviar para pametros del Host a Docker

- docker run --name some-mongo -p 27017-27017 -d mongo

Enviar para pametros del Host a Docker Persistencia en data

- docker run -p 3000:3000 -v $(pwd):/var/www/ -w "/var/www" node npm start

- sudo docker run -it --rm --name my-running-script -v "$PWD":/var/www -w /var/www node npm start

-- iniciar

- sudo systemctl enable docker
- sudo systemctl disable docker

## configuracion de la aplicacion

- docker app status my-ap

## Create Red Docker

- docker network create app-network

## docker compose

- docker-compose up --build
- docker-compose up
- docker-compose ps
- docker-compose down
- docker-compose exec db bash
