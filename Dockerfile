FROM tghs/cli

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup | bash -  && \
    apt-get install -y nodejs  && \
    npm -g install npm@latest-2 && \
    apt-get remove --purge curl -y  && \
    apt-get clean && \
    npm install -g \
    bower
    webpack


# For some strange reason Bower doesn't like running
# without a /var/www directory! Even if we're running
# it from a completely different directory! Strange!? 
RUN mkdir -p /data /var/www && \
    chown www-data:www-data /var/www
VOLUME ["/data"]
WORKDIR /data

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
