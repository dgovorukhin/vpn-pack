#!/bin/bash

container_name=vpn-pack-build
image_name=vpn-pack-build

echo "build image"
docker build -t $image_name -f Dockerfile.build .

echo "run build container"
docker run -i -d --rm --name $container_name $image_name:latest

echo "copy artifacts from build container"
docker cp $container_name:/build/docker-compose.yaml ../docker-compose.yaml

echo "stop build container"
docker stop $container_name

echo "remove build image"
docker rmi $image_name