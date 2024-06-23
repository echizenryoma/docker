FROM --platform=$TARGETPLATFORM alpine:latest

ADD https://raw.githubusercontent.com/xykt/IPQuality/main/ip.sh /app/ip.sh

RUN chmod +x /app/ip.sh
RUN apk --no-cache add bash jq curl bc netcat-openbsd grep bind-tools iproute2

ENTRYPOINT [ "/app/ip.sh" ]
CMD [ ]
