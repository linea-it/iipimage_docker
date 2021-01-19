FROM debian:jessie

ENV IIP_VERSION=372913e6b8f956073155f85f61ab50a8d0b29eab

ENV LOGFILE=/var/log/iipsrv.log
ENV VERBOSITY=10

RUN apt-get update \
        && apt-get dist-upgrade -y \
        && apt-get install -y \
        wget \
        curl \
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

RUN ./autogen.sh \
        && ./configure \
        && make 

# Add Health Check script
ADD health_check_iipserver.sh /iipsrv-astro-${IIP_VERSION}/

# Instalação do logrotate e cron
RUN apt-get update \
        && apt-get dist-upgrade -y \
        && apt-get install -y \
        logrotate \
        cron \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Copy logrotate conf for iipserver
ADD logrotate_iipserver.conf /etc/logrotate.d/
RUN chmod 0644 /etc/logrotate.d/logrotate_iipserver.conf

ADD start_fcgi.sh /iipsrv-astro-${IIP_VERSION}/

EXPOSE 9000
