FROM --platform=$TARGETPLATFORM rust:alpine as build

RUN apk update
RUN apk add git gcc g++ musl-dev cmake make autoconf automake libtool pkgconfig

WORKDIR /app
RUN git clone --recursive https://github.com/cloudflare/quiche

WORKDIR /app/quiche
RUN cargo build --release --features ffi,pkg-config-meta,qlog --config net.git-fetch-with-cli=true --package quiche
RUN mkdir quiche/deps/boringssl/src/lib
RUN ln -vnf $(find target/release -name libcrypto.a -o -name libssl.a) quiche/deps/boringssl/src/lib/

WORKDIR /app
RUN git clone https://github.com/curl/curl

WORKDIR /app/curl
RUN autoreconf -fi
RUN ./configure LDFLAGS="-Wl,-rpath,$PWD/../quiche/target/release" --with-openssl=$PWD/../quiche/quiche/deps/boringssl/src --with-quiche=$PWD/../quiche/target/release
RUN make
RUN make install

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/local/bin /usr/local/bin
COPY --from=build /usr/local/lib /usr/local/lib

RUN apk update && apk add libgcc

ENTRYPOINT [ "/usr/local/bin/curl" ]
CMD [ ]
