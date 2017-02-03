FROM alpine:latest
MAINTAINER Jaeyoung Chun (chunj@mskcc.org)

LABEL maintainer="chunj@mskcc.org" \
      version="1.0"

ENV TOOL_VERSION 0.7.15

ADD http://downloads.sourceforge.net/project/bio-bwa/bwa-${TOOL_VERSION}.tar.bz2 /tmp/

RUN apk add --update --no-cache ncurses \
        && apk add --virtual=deps --update --no-cache  musl-dev zlib-dev make  gcc \
        && cd /tmp/ && tar xjvf bwa-${TOOL_VERSION}.tar.bz2 \
        && cd /tmp/bwa-${TOOL_VERSION} \ 
        && sed -i '1i#include <stdint.h>' kthread.c \
        && sed -i[.bak] "s/u_int32_t/uint32_t/g" *.c  \
        && sed -i[.bak] "s/u_int32_t/uint32_t/g" *.h  \
        && make \
        && mv /tmp/bwa-${TOOL_VERSION}/bwa /usr/bin \
        && rm -rf /var/cache/apk/* /tmp/* \
        && apk del deps

ENTRYPOINT ["/usr/bin/bwa"]
