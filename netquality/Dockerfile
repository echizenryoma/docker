FROM --platform=$TARGETPLATFORM debian:latest

ADD https://raw.githubusercontent.com/xykt/NetQuality/refs/heads/main/net.sh /app/ip.sh

SHELL ["/bin/bash", "-c"] 

RUN chmod +x /app/ip.sh
RUN apt update && \
    apt install -y jq curl imagemagick mtr iperf3 stun bc procps && \
    apt clean && \
    rm -rf /tmp/* /var/tmp/*
RUN source /app/ip.sh && install_speedtest
RUN curl -Ls nxtrace.org/nt | bash
ENV LC_ALL C.UTF-8
ENTRYPOINT [ "/app/ip.sh" ]
CMD [ ]
