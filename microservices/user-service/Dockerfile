FROM node
WORKDIR /app
COPY package*.json ./
RUN npm install
# Bundle app source
COPY . .
ENV PORT 5000
EXPOSE 5000
ENTRYPOINT ["npm", "start"]