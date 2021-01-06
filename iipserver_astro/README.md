# Running iipserver

## Instalation

```
cp docker-compose.yml.template docker-compose.yml
cp nginx/nginx-proxy.conf.template nginx/nginx-proxy.conf
```

## Image folder

Make sure you mapped your images to a tiff folder inside the container

## Convert image to correct format

Follow the steps described [here](http://iipimage.sourceforge.net/documentation/images/).

## Starting the server

```
docker-compose up
```

## Example

1. Create and convert a image saving at tiff/output_image.tif
2. Access `http://localhost/?FIF=output_image.tif&WID=1900&CVT=jpeg`