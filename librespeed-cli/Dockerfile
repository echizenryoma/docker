FROM --platform=$TARGETPLATFORM golang:alpine as build

RUN apk update
RUN apk add git bash

WORKDIR /app
RUN git clone --recursive https://github.com/librespeed/speedtest-cli

WORKDIR /app/speedtest-cli
RUN ./build.sh

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/src/librespeed-cli/out/librespeed-cli* /usr/local/bin/librespeed-cli

ENTRYPOINT [ "/usr/local/bin/librespeed-cli" ]
CMD [ ]
