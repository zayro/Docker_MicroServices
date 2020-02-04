FROM node
ENV NODE_ENV production
WORKDIR /usr/src/app
RUN npm install
COPY . .
EXPOSE 8081
CMD npm start