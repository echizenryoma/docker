FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk update && \
    apk add bash curl && \
    mkdir /app && \
    curl -L "https://github.com/yeahwu/check/raw/main/check.sh" -o /app/check.sh && \
    chmod +x /app/check.sh

ENTRYPOINT [ "/usr/bin/bash" ]
CMD [ "/app/check.sh" ]
