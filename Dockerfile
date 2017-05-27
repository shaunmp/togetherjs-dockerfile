FROM alpine:latest
LABEL maintainer shaun@shaun.io

WORKDIR ["/app"]

RUN apk add --update nodejs nodejs-npm && \
    npm install npm@latest -g && \
    npm install websocket optimist

ADD "https://github.com/mozilla/togetherjs/raw/develop/hub/websocket-compat.js" "websocket-compat.js"
ADD "https://raw.githubusercontent.com/mozilla/togetherjs/master/hub/server.js" "server.js"

EXPOSE 8080

ENTRYPOINT ["node", "server.js"]

