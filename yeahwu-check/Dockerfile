FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk update &&
    apk add bash curl
COPY ./check.sh /app/check.sh

ENTRYPOINT [ "/usr/bin/bash" ]
CMD [ "/app/check.sh" ]
