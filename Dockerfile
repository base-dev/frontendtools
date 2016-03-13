FROM tghs/cli

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup | bash -  && \
    apt-get install -y nodejs  && \
    npm -g install npm@latest-2 && \
    apt-get remove --purge curl -y  && \
    apt-get clean

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
