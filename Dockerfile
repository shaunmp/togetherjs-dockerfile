FROM node
LABEL maintainer shaun@shaun.io

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install

COPY . /usr/src/app

EXPOSE 8080

ADD "https://github.com/mozilla/togetherjs/raw/develop/hub/websocket-compat.js" "websocket-compat.js"
ADD "https://raw.githubusercontent.com/mozilla/togetherjs/master/hub/server.js" "server.js"

EXPOSE 8080

CMD [ "npm", "start" ]

