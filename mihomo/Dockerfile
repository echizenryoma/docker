FROM --platform=$TARGETPLATFORM golang:alpine as build
WORKDIR /app

RUN apk update
RUN apk add git
RUN git clone -b Alpha https://github.com/echizenryoma/mihomo.git

WORKDIR /app/mihomo
RUN go mod download
RUN go build .

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main
COPY --from=build /app/mihomo/mihomo /mihomo
RUN apk add --no-cache ca-certificates tzdata iptables
VOLUME ["/root/.config/mihomo/"]
ENTRYPOINT [ "/mihomo" ]
