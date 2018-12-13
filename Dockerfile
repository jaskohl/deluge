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
