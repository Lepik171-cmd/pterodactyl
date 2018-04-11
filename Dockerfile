# Based on: https://github.com/parkervcp/images/tree/samp

FROM ubuntu:18.04

MAINTAINER Gerry-Rego Lepik <gerry@gerry.ee>

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils libc6:i386 zlib1g:i386 libstdc++6:i386 tar curl iproute2 openssl \
    && useradd -d /home/container -m container

RUN curl -O http://archive.ubuntu.com/ubuntu/pool/universe/o/openssl098/libssl0.9.8_0.9.8o-7ubuntu3.2_i386.deb \
    && dpkg -i libssl0.9.8_0.9.8o-7ubuntu3.2_i386.deb \
    && rm libssl0.9.8_0.9.8o-7ubuntu3.2_i386.deb

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
