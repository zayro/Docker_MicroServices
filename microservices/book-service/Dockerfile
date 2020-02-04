FROM node
COPY . /var/www
WORKDIR /var/www
RUN npm install 
ENV PORT 3000
EXPOSE 3000
ENTRYPOINT ["npm", "start"]