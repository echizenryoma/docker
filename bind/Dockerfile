FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk add --no-cache bind

CMD [ "/usr/sbin/named", "-g" ]
