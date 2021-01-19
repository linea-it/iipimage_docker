FROM debian:jessie
COPY . /iip
RUN apt-get update \
        && apt-get dist-upgrade -y \
        && apt-get install -y \
            g++ \
            make \
            autoconf \
            automake \
            libtool \
            libtiff5-dev \
            libopenjpeg-dev \
            libzthread-dev \
            libmemcached-dev \
            libpng-dev \
            zlib1g-dev \
            spawn-fcgi \
            pkg-config \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /iip/srv

RUN ./autogen.sh \
        && ./configure \
        && make 

WORKDIR /iip

EXPOSE 9000
