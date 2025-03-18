FROM node
WORKDIR /app
COPY package*.json ./
RUN npm install
# Bundle app source
COPY . .
ENV PORT 3000
EXPOSE 3000
ENTRYPOINT ["npm", "start"]