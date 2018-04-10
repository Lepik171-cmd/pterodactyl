# Based on: https://github.com/parkervcp/images/tree/samp

FROM debian:latest

MAINTAINER Gerry-Rego Lepik <gerry@gerry.ee>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget apt-utils multiarch-support libstdc++6 lib32stdc++6 tar curl iproute2 openssl \
    && useradd -d /home/container -m container

RUN wget http://snapshot.debian.org/archive/debian/20110406T213352Z/pool/main/o/openssl098/libssl0.9.8_0.9.8o-7_i386.deb \
    && dpkg -i libssl0.9.8_0.9.8o-7_i386.deb \
    && rm libssl0.9.8_0.9.8o-7_i386.deb

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
