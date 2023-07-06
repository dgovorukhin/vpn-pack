#!/bin/bash

container_name=vpn-pack-build
image_name=vpn-pack-build

echo "build image"
docker build -t $image_name -f Dockerfile.build .

echo "run build container"
docker run -i -d --rm --name $container_name $image_name:latest

echo "copy artifacts from build container"
docker cp $container_name:/build/docker-compose.yaml ../docker-compose.yaml

docker cp $container_name:/build/config.yaml ../config.yaml

mkdir ../wireguard-ui/db
mkdir ../wireguard-ui/db/clients
mkdir ../wireguard-ui/db/server

docker cp $container_name:/build/pihole-dns.json ../wireguard-ui/db/clients/pihole-dns.json
docker cp $container_name:/build/keypair.json ../wireguard-ui/db/server/keypair.json

docker cp $container_name:/build/wg0.conf ../pi-hole/wg0.conf

echo "stop build container"
docker stop $container_name

echo "remove build image"
docker rmi $image_name

docker build -t vpn-pack-pihole -f Dockerfile.pihole .