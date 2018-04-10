# Based on: https://github.com/parkervcp/images/tree/samp

FROM debian:9

MAINTAINER Gerry-Rego Lepik <gerry@gerry.ee>

RUN apt update \
    && apt upgrade -y \
    && apt install -y libstdc++6 lib32stdc++6 tar curl iproute2 openssl \
    && useradd -d /home/container -m container

RUN curl -O http://archive.ubuntu.com/ubuntu/pool/universe/o/openssl098/libssl0.9.8_0.9.8o-7ubuntu3.2_amd64.deb \
    && dpkg -i libssl0.9.8_0.9.8o-7ubuntu3.2_amd64.deb \
    && rm libssl0.9.8_0.9.8o-7ubuntu3.2_amd64.deb \
    && ln -s /usr/lib/libssl.so.0.9.8 /usr/lib/x86_64-linux-gnu/libssl.so.0.9.8

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
