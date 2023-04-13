FROM --platform=$TARGETPLATFORM rust:alpine as build

ARG GIT_BRANCH

WORKDIR /app

RUN apk update
RUN apk add git gcc musl-dev
RUN git clone https://github.com/EAimTY/tuic.git

WORKDIR /app/tuic
RUN git checkout $GIT_BRANCH
RUN cargo build --release --config net.git-fetch-with-cli=true --package tuic-server
RUN cp ./target/release/tuic-server /usr/bin/tuic-server
RUN chmod +x /usr/bin/tuic-server
# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/bin/tuic-server /usr/bin/tuic-server

ENTRYPOINT [ "/usr/bin/tuic-server" ]
CMD [ "-c", "/etc/tuic/config.json" ]
