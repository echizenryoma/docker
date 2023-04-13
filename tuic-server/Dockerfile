FROM --platform=$TARGETPLATFORM ubuntu:latest as build
ARG TARGETPLATFORM

COPY target ./target

RUN if [ "${TARGETPLATFORM}" = "linux/386" ]; then export RUSTTARGET=i686-unknown-linux-gnu ; fi \
    && if [ "${TARGETPLATFORM}" = "linux/amd64" ]; then export RUSTTARGET=x86_64-unknown-linux-gnu ; fi  \
    && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export RUSTTARGET=aarch64-unknown-linux-gnu ; fi  \
    && if [ -z "${RUSTTARGET}" ]; then echo "unknown RUSTTARGET: ${RUSTTARGET}"; exit 1; fi \
    && cp ./target/${RUSTTARGET}/release/tuic-server /usr/bin/tuic-server

# END build

FROM --platform=$TARGETPLATFORM ubuntu:latest as main

COPY --from=build /usr/bin/tuic-server /usr/bin/tuic-server
RUN chmod +x /usr/bin/tuic-server

ENTRYPOINT [ "/usr/bin/tuic-server" ]
CMD [ "-c", "/etc/tuic/config.json" ]
