FROM alpine:latest
LABEL maintainer shaun@shaun.io

WORKDIR ["/app"]

RUN apk add --update nodejs nodejs-npm && \
    npm install npm@latest -g && \
    npm install websocket optimist

ADD "https://raw.githubusercontent.com/mozilla/togetherjs/master/hub/server.js" "server.js"

EXPOSE 8080

ENTRYPOINT ["node", "server.js"]

