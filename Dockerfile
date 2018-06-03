FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="MetalMichael version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="MetalMichael"

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

RUN \
 echo "**** install app ****" && \
 pip install influxdb && \
 git clone --depth 1 https://github.com/barrycarey/Plex-Data-Collector-For-InfluxDB /app/plex-data-collector

# add local files
COPY root/ /

# ports and volumes
WORKDIR /app/plex-data-collector
VOLUME /config