FROM --platform=$TARGETPLATFORM debian:latest

ADD https://raw.githubusercontent.com/xykt/IPQuality/main/ip.sh /app/ip.sh

RUN chmod +x /app/ip.sh
RUN apt update && \
    apt install -y jq curl bc netcat-openbsd dnsutils iproute2 && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

ENTRYPOINT [ "/app/ip.sh" ]
CMD [ ]
