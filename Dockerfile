# syntax=docker/dockerfile:1

FROM lscr.io/linuxserver/webtop:ubuntu-mate

# set version label
ARG BUILD_DATE
ARG VERSION
ARG XFCE_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Edumotiv"

# title
ENV TITLE="jaamsim image"

RUN \ 
mkdir -p /usr/share/man/man1 && \
apt-get update && \
apt-get -y install default-jre wget unzip && \ 
rm -rf /var/lib/apt/lists/* && \
mkdir -p /apps && \
wget -O /apps/jaamsim.jar "https://github.com/jaamsim/jaamsim/releases/download/v2025-10/JaamSim2025-10.jar"

# add local filesa
# COPY /root /

# ports and volumes
EXPOSE 3001

VOLUME /config
