FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="MetalMichael version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="MetalMichael"

ENV INFLUXDB_ADDRESS localhost
ENV INFLUXDB_PORT 8086
ENV INFLUXDB_DATABASE plex_data
ENV INFLUXDB_USERNAME ""
ENV INFLUXDB_PASSWORD ""

ENV PLEX_USERNAME ""
ENV PLEX_PASSWORD ""
ENV PLEX_SERVERS localhost

RUN \
 echo "**** install app ****" && \
 pip install influxdb && \
 git clone --depth 1 https://github.com/barrycarey/Plex-Data-Collector-For-InfluxDB /app/plex-data-collector

# add local files
COPY root/ /

RUN \
 python /app/plex-data-collector/updateConfig.py && \
 mv /app/plex-data-collector/config.ini /config/config.ini
 
# ports and volumes
WORKDIR /app/plex-data-collector
VOLUME /config