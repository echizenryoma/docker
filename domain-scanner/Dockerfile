FROM --platform=$TARGETPLATFORM golang:alpine as build
WORKDIR /app

RUN apk update
RUN apk add git
RUN git clone https://github.com/xuemian168/domain-scanner.git

WORKDIR /app/domain-scanner
RUN go mod download
RUN go build -o domain-scanner main.go

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /app/domain-scanner/domain-scanner /usr/bin/domain-scanner

ENTRYPOINT [ "/usr/bin/domain-scanner" ]
CMD [ ]
