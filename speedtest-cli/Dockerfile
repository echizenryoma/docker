FROM --platform=$TARGETPLATFORM debian:latest

ADD https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh /app/script.deb.sh

RUN bash /app/script.deb.sh && \
    rm /app/script.deb.sh && \
    apt update && \
    apt install -y speedtest && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

ENTRYPOINT [ "/usr/bin/speedtest" ]
CMD ["--accept-license", "--accept-gdpr"]
