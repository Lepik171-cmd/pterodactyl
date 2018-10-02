# Based on: https://github.com/parkervcp/images/tree/samp

FROM debian:9

MAINTAINER Gerry-Rego Lepik <gerry@gerry.ee>

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils mysql-client libc6 libc6:i386 zlib1g:i386 lib32gcc1 libstdc++6 wget lib32stdc++6 tar curl wine32 unzip iproute2 openssl \
    && useradd -d /home/container -m container

RUN curl -O http://snapshot.debian.org/archive/debian/20110406T213352Z/pool/main/o/openssl098/libssl0.9.8_0.9.8o-7_i386.deb \
    && dpkg -i libssl0.9.8_0.9.8o-7_i386.deb \
    && rm libssl0.9.8_0.9.8o-7_i386.deb

USER container
ENV DISPLAY :0
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
