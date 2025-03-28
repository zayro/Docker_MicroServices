FROM node
WORKDIR /app
COPY . /app
RUN npm install
# Bundle app source
ENV PORT 3000
EXPOSE 3000
ENTRYPOINT ["npm", "start"]