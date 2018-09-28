FROM debian:jessie

ENV IIP_VERSION=74e17e2e124f5d7af0eddc020cd973588c784a1b

RUN apt-get update \
        && apt-get dist-upgrade \
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
            # apache2 \
            # libapache2-mod-fastcgi \
            # libapache2-mod-wsgi-py3 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# RUN a2enmod fastcgi

RUN wget https://github.com/cmarmo/iipsrv-astro/archive/${IIP_VERSION}.zip \
        && unzip ${IIP_VERSION}.zip \
        && rm -f ${IIP_VERSION}.zip


RUN cd iipsrv-astro-${IIP_VERSION} \
        && ./autogen.sh \
        && ./configure \
        && make 

COPY ./start_fcgi.sh .

WORKDIR iipsrv-astro-${IIP_VERSION}

EXPOSE 9000

# ENTRYPOINT start-stop-daemon --start --oknodo --name fcgi --startas start_fcgi.sh