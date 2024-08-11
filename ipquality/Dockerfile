FROM --platform=$TARGETPLATFORM debian:latest

ADD https://raw.githubusercontent.com/xykt/IPQuality/main/ip.sh /app/ip.sh

RUN chmod +x /app/ip.sh
RUN apt update && \
    apt install -y jq curl bc netcat-openbsd dnsutils iproute2 && \
    apt clean && \
    rm -rf /tmp/* /var/tmp/*
ENV LC_ALL C.UTF-8
ENTRYPOINT [ "/app/ip.sh" ]
CMD [ ]
