FROM --platform=$TARGETPLATFORM golang:alpine as build
WORKDIR /app

RUN apk update
RUN apk add git
RUN git clone https://github.com/XIU2/CloudflareSpeedTest.git

WORKDIR /app/CloudflareSpeedTest
RUN go mod download
RUN go build -o cfst main.go

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /app/CloudflareSpeedTest/cfst /usr/bin/cfst

WORKDIR /app
ENTRYPOINT [ "/usr/bin/cfst" ]
CMD [ ]
