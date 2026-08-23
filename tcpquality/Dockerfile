FROM --platform=$TARGETPLATFORM alpine:latest as build
WORKDIR /app

RUN apk add --no-cache bash curl ca-certificates git
RUN git clone https://github.com/ibsgss/TcpQuality
RUN curl -sL https://nxtrace.org/nt | bash -s -- --flavor tiny

FROM --platform=$TARGETPLATFORM alpine:latest as main

RUN apk add --no-cache bash curl ca-certificates bind-tools \
    nmap nmap-nping traceroute iproute2 iputils coreutils \
    findutils gawk grep sed tar iptables kmod ncurses tzdata \
    net-tools procps util-linux

COPY --from=builder /app/TcpQuality/runTcpQuality.sh /bin/runTcpQuality.sh
COPY --from=builder /app/TcpQuality/runTcpQuality-menu.sh /bin/runTcpQuality-menu.sh
COPY --from=builder /app/TcpQuality/runTcpQuality-core.sh /bin/runTcpQuality-core.sh
COPY --from=builder /usr/local/bin/nexttrace-tiny /bin/nexttrace-tiny

ENTRYPOINT ["/bin/runTcpQuality-menu.sh"]
CMD [ ]
