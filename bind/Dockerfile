FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk add --no-cache bind

ENTRYPOINT [ "/usr/bin/named" ]
CMD [ "-g" ]
