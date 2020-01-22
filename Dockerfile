FROM debian

LABEL original-maintainer Tim Lien <timlientw@gmail.com>

ENV SMARTFOX_VERSION 2_14_0

RUN mkdir -p /tmp

WORKDIR /tmp

# You should provide source by yourself so we doesn't need `apt-get wget` anymore 
# Please go to https://www.smartfoxserver.com/download/sfs2x#p=installer for the latest
COPY SFS2X_unix_${SMARTFOX_VERSION}.tar.gz /tmp/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz

WORKDIR /opt/SmartFoxServer_2X

VOLUME /opt/SmartFoxServer_2X

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080 9933 9933/udp 8787 5000

CMD ["sfs2x"]
