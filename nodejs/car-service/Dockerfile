FROM node
WORKDIR /app
COPY package*.json ./
RUN npm install 
# Bundle app source
COPY . .
ENV PORT 4000
EXPOSE 4000
ENTRYPOINT ["npm", "start"]