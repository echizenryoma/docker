FROM --platform=$TARGETPLATFORM debian:latest

ADD https://raw.githubusercontent.com/i-abc/Speedtest/main/speedtest.sh /app/speedtest.sh
RUN chmod +x /app/speedtest.sh
RUN apt update && \
    apt install -y curl tar iperf3 bc && \
    apt clean && \
    rm -rf /tmp/* /var/tmp/*

ENTRYPOINT [ "/app/speedtest.sh" ]
CMD []
