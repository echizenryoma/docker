FROM --platform=$TARGETPLATFORM alpine:latest

ADD  https://raw.githubusercontent.com/xykt/IPQuality/main/ip.sh /app

RUN apk update && \
    apk add jq curl bc netcat-openbsd grep bind-tools iproute2 && \
    chmod +x /app/ip.sh

ENTRYPOINT [ "/app/ip.sh" ]
CMD [ ]
