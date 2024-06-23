FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk update && \
    apk add jq curl bc netcat-openbsd grep bind-tools iproute2

ENTRYPOINT [ "bash <(curl -Ls IP.Check.Place)" ]
CMD [ ]
