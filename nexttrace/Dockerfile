FROM --platform=$TARGETPLATFORM alpine as build
WORKDIR /app

RUN apk update
RUN apk add bash curl
RUN curl nxtrace.org/nt | bash
# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/local/bin/nexttrace /usr/local/bin/nexttrace

ENTRYPOINT [ "/usr/local/bin/nexttrace" ]
CMD [ ]
