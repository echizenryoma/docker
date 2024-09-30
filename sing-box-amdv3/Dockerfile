FROM --platform=$TARGETPLATFORM alpine as build
WORKDIR /app

RUN apk update
RUN apk add jq curl tar gzip

WORKDIR /app/sing-box
RUN version=$(curl -Lsf "https://api.github.com/repos/SagerNet/sing-box/releases/latest" | jq -r ".name") && curl -L "https://github.com/SagerNet/sing-box/releases/download/v${version}/sing-box-${version}-linux-amd64v3.tar.gz" -o /app/sing-box/sing-box-${version}-linux-amd64v3.tar.gz
RUN tar -xzvf /app/sing-box/sing-box-${version}-linux-amd64v3.tar.gz
RUN rm /app/sing-box/sing-box-${version}-linux-amd64v3.tar.gz

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main
RUN set -ex && \
    apk upgrade && \
    apk add bash tzdata ca-certificates nftables && \
    rm -rf /var/cache/apk/*
COPY --from=builder /app/sing-box/sing-box /usr/local/bin/sing-box
ENTRYPOINT ["sing-box"]
