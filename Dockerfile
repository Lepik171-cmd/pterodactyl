# Based on: https://github.com/parkervcp/images/tree/samp

FROM debian:latest

MAINTAINER Gerry-Rego Lepik <gerry@gerry.ee>

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt upgrade -y \
    && apt install -y libc6 zlib1g dpkg libstdc++6 lib32stdc++6 tar curl iproute2 \
    && useradd -d /home/container -m container

RUN curl -O http://snapshot.debian.org/archive/debian/20110406T213352Z/pool/main/o/openssl098/libssl0.9.8_0.9.8o-7_i386.deb \
    && dpkg --force-architecture --install libssl0.9.8_0.9.8o-7_i386.deb \
    && rm libssl0.9.8_0.9.8o-7_i386.deb \
    && ln -s /usr/lib/libssl.so.0.9.8 /usr/lib/x86_64-linux-gnu/libssl.so.0.9.8

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
