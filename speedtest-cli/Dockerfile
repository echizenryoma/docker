FROM --platform=$TARGETPLATFORM alpine as build

RUN apk update
RUN apk add tar curl

WORKDIR /app
COPY ./get-download-url.sh /app/
RUN ARCH=$(apk info --print-arch) && \
    URL=$(/app/get-download-url.sh ${ARCH})&& \
    curl -sSL "${URL}" | tar xz 
RUN mv /app/speedtest /usr/local/bin/
# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/local/bin/speedtest /usr/local/bin/speedtest

ENTRYPOINT [ "/usr/local/bin/speedtest" ]
CMD ["--accept-license", "--accept-gdpr"]
