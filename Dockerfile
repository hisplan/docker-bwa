FROM ubuntu:20.04

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)" \
      version="0.7.17" \
      source="https://github.com/lh3/bwa/releases/tag/v0.7.17"

ENV TOOL_VERSION 0.7.17

RUN apt-get update \
      && apt-get install --yes build-essential wget zlib1g-dev

RUN cd /tmp && wget https://github.com/lh3/bwa/releases/download/v${TOOL_VERSION}/bwa-${TOOL_VERSION}.tar.bz2 \
      && tar xjvf bwa-${TOOL_VERSION}.tar.bz2 \
      && cd /tmp/bwa-${TOOL_VERSION} \
      && make \
      && mv /tmp/bwa-${TOOL_VERSION}/bwa /usr/bin

ENTRYPOINT ["/usr/bin/bwa"]
