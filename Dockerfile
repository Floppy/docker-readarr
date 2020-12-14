FROM lsiobase/mono:LTS

ARG READARR_VERSION
LABEL build_version="${READARR_VERSION}"
LABEL maintainer="floppy"

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_CONFIG_HOME="/config/xdg"
ENV READARR_BRANCH="unstable"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
        libicu60 && \
 echo "**** install Readarr ****" && \
 mkdir -p /app/readarr/bin && \
 curl -o \
	/tmp/readarr.tar.gz -L \
	"https://readarr.servarr.com/v1/update/nightly/updatefile?version=${READARR_VERSION}&os=linux&runtime=netcore&arch=arm" && \
 tar xf \
	/tmp/readarr.tar.gz -C \
	/app/readarr/bin --strip-components=1 && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8787
VOLUME /config
