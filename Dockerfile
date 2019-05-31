FROM debian:stable

COPY . /iip

RUN \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y -q update \
    && apt-get -y -q --no-install-recommends install \
		iipimage-server \
                gosu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/log/dpkg.log

ENV LANG=C

WORKDIR /iip

COPY start.sh /iip

EXPOSE 9000