FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk update && \
    apk add openssl

ENTRYPOINT [ "/usr/bin/openssl" ]
CMD [ ]
