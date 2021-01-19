# IIPImage docker images

This repository provides docker images for the IIPImage image server.

This repository is not official, and only serves to exemplify the installation of the IIPImage in a docker container.
For more information visit the official website: (https://iipimage.sourceforge.io/)

O repositório está dividido em 2 diretórios diferentes com os arquivos necessários para criação da imagem docker, e algum exemplo de configuração.  

* iipserver - Refers to the original IIPImage (https://github.com/ruven/iipsrv)
* iipserver_astro - Refers to the IIPImage Astro fork (https://github.com/cmarmo/iipsrv-astro)

Docker images are available in this repository (https://hub.docker.com/repository/docker/linea/iipserver) and are divided by the tag:

linea/iipserver: latest is the most current image based on the official IIPImage.

linea/iipserver: astro_xxx are images based on the Astro fork.
