/var/log/nginx/error.log
sudo service nginx restart
/etc/hosts

 docker run --name some-nginx -v .:/usr/share/nginx/html:ro -d nginx

docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx

docker run --name some-nginx -d -p 8080:80 some-content-nginx

docker run -p 3000:3000 -v $(pwd):/usr/share/nginx/html -w "/usr/share/nginx/html" nginx