# Based on: https://github.com/parkervcp/images/tree/samp

FROM ubuntu:16.04

MAINTAINER Mark Vainomaa <mikroskeem@mikroskeem.eu>

RUN apt update \
    && apt upgrade -y \
    && apt install -y libstdc++6 lib32stdc++6 tar curl iproute2 openssl \
    && useradd -d /home/container -m container

RUN curl -O http://archive.ubuntu.com/ubuntu/pool/universe/o/openssl098/libssl0.9.8_0.9.8o-7ubuntu3.2_amd64.deb \
    && dpkg -i libssl0.9.8_0.9.8o-7ubuntu3.2_amd64.deb \
    && rm libssl0.9.8_0.9.8o-7ubuntu3.2_amd64.deb

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
