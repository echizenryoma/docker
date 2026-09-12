FROM golang:alpine AS builder
WORKDIR /app

ARG TAG=lx
RUN apk add --no-cache git make
RUN git clone --recurse-submodules --branch "${TAG}" https://github.com/Leadaxe/sing-box-lx.git

WORKDIR /app/sing-box-lx
RUN make -f Makefile.lx lx-build

FROM alpine
WORKDIR /app

RUN apk add --no-cache bash tzdata ca-certificates nftables

COPY --from=builder /app/sing-box-lx/sing-box /usr/local/bin/sing-box
ENTRYPOINT ["/usr/local/bin/sing-box"]
