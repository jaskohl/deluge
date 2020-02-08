# locking release to 5b398f77-ls22 due to some error with current builds
# updating to 2.0.3-2201906121747ubuntu18.04.1-ls51
FROM linuxserver/deluge:2.0.3-2201906121747ubuntu18.04.1-ls51

# install software
RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y apt-utils iputils-ping && \
 echo "**** cleanup ****" && \
 apt-get --purge autoremove -y && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*
