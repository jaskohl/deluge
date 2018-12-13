FROM linuxserver/deluge:latest

# install software
RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y netcat && \
 echo "**** cleanup ****" && \
 apt-get --purge autoremove -y && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8112 58846 58946 58946/udp
VOLUME /config /downloads
HEALTHCHECK --interval=5s --timeout=5s --retries=20 CMD ["nc -z localhost 58946 || exit 1"]
