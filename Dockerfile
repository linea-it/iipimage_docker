FROM ubuntu:16.04

ENV IIP_VERSION=74e17e2e124f5d7af0eddc020cd973588c784a1b

RUN apt-get update \
        && apt-get install -y \
            wget \
            unzip \
            g++ \
            make \
            autoconf \
            automake \
            libtool \
            libtiff5-dev \
            libopenjpeg-dev \
            libzthread-dev \
            # libmemcached-dev \
            libpng-dev \
            zlib1g-dev \
            libapache2-mod-fastcgi \
            vim \
        && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/cmarmo/iipsrv-astro/archive/${IIP_VERSION}.zip \
        && unzip ${IIP_VERSION}.zip \
        && rm -f ${IIP_VERSION}.zip


RUN cd iipsrv-astro-${IIP_VERSION} \
        && ./autogen.sh \
        && ./configure \
        && make 

RUN ls -ltr
