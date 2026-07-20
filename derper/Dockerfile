FROM golang:alpine AS builder
WORKDIR /app

ARG DERP_VERSION=latest
RUN go install tailscale.com/cmd/derper@${DERP_VERSION}

FROM alpine
WORKDIR /app

RUN apk add --no-cache ca-certificates

ENV DERP_DOMAIN="example.com"
ENV DERP_CERT_MODE="manual"
ENV DERP_CERT_DIR="/app/certs"
ENV DERP_ADDR=":443"
ENV DERP_STUN=true
ENV DERP_STUN_PORT=3478
ENV DERP_HTTP_PORT=80
ENV DERP_VERIFY_CLIENTS=false
ENV DERP_SOCKET=""

COPY --from=builder /go/bin/derper .

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
