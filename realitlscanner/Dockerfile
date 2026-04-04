FROM --platform=$TARGETPLATFORM golang:alpine as build
WORKDIR /app

RUN apk update
RUN apk add git
RUN git clone https://github.com/XTLS/RealiTLScanner.git

WORKDIR /app/RealiTLScanner
RUN go mod download
RUN go build -o RealiTLScanner .

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

RUN apk add --no-cache ca-certificates

COPY --from=build /app/RealiTLScanner/RealiTLScanner /usr/bin/RealiTLScanner

WORKDIR /app
ENTRYPOINT [ "/usr/bin/RealiTLScanner" ]
CMD [ ]
