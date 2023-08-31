FROM --platform=$TARGETPLATFORM alpine as build
WORKDIR /app

RUN apk update
RUN apk add git gcc g++ make cmake geoip-dev
RUN git clone https://github.com/dreibh/subnetcalc.git

WORKDIR /app/subnetcalc
RUN mkdir build

WORKDIR /app/subnetcalc/build
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr ..
RUN make -j$(nproc)
RUN make install

# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/bin/subnetcalc /usr/bin/subnetcalc
COPY --from=build /usr/share/man/man1/subnetcalc.1 /usr/share/man/man1/subnetcalc.1

RUN apk add --no-cache libstdc++ geoip

ENTRYPOINT [ "/usr/bin/subnetcalc" ]
CMD [ ]
