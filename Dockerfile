FROM node:18

WORKDIR /usr/src/webapp

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8000

CMD [ "node", "server.js" ]