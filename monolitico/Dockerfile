FROM node:10
# RUN mkdir /app
# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm --verbose install
# Bundle app source
COPY . .
ENV PORT 3000
EXPOSE 3000
CMD ["npm", "start"]