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
RUN ./buildconf
RUN ./configure LDFLAGS="-Wl,-rpath,$PWD/../quiche/target/release" \
        --with-openssl=$PWD/../quiche/quiche/deps/boringssl/src \
        --with-quiche=$PWD/../quiche/target/release \
        --enable-alt-svc \
        --disable-ldap \
        --disable-ldaps \
        --disable-manual \
        --disable-shared \
        --enable-ipv6 \
        --enable-threaded-resolver \
        --with-random=/dev/urandom \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
RUN make -j$(nproc)
RUN make install

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/local/bin/curl /usr/local/bin/curl

RUN apk update && apk add libgcc

ENTRYPOINT [ "/usr/local/bin/curl" ]
CMD [ ]
