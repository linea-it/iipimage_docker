FROM debian:jessie

ENV IIP_VERSION=372913e6b8f956073155f85f61ab50a8d0b29eab

RUN apt-get update \
        && apt-get dist-upgrade -y \
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
            libmemcached-dev \
            libpng-dev \
            zlib1g-dev \
            spawn-fcgi \
            vim \
            pkg-config \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/cmarmo/iipsrv-astro/archive/${IIP_VERSION}.zip \
        && unzip ${IIP_VERSION}.zip \
        && rm -f ${IIP_VERSION}.zip

WORKDIR /iipsrv-astro-${IIP_VERSION}

ADD start_fcgi.sh /iipsrv-astro-${IIP_VERSION}/

RUN ./autogen.sh \
        && ./configure \
        && make 

# ADD /tiff /images

EXPOSE 9000
