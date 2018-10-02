# Based on: https://github.com/parkervcp/images/tree/samp

FROM debian:wheezy

MAINTAINER Gerry-Rego Lepik <gerry@gerry.ee>


RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes wine
ENV DISPLAY :0
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
