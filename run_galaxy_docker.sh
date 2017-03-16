#! /bin/bash

NAME=ifbgalaxy
VERSION=16.10
ADMIN_USER=$ADMIN_USER
CONF_DIR=$(pwd)/galaxy_nginx_conf.d

# IMP sous Ubuntu 14.04 docker should have daemon option ----storage-driver=devicemapper

docker stop $NAME
docker rm -v $NAME

echo "Run galaxy-docker "
docker run -d \
        -p 8080:80 -p 8021:21 -p 8800:8800 \
        -v ${CONF_DIR}:/etc/nginx/conf.d:ro \
        -e GALAXY_CONFIG_USE_REMOTE_ADMIN_USER=True \
	-e GALAXY_DEFAULT_ADMIN_ADMIN_USER=$ADMIN_USER \
	-e GALAXY_CONFIG_ADMIN_ADMIN_USERS=$ADMIN_USER \
        --name $NAME \
        bgruening/galaxy-stable:$VERSION

echo -e "\n\n"
sleep 5s
docker ps

echo -e "\n\n"
docker logs -f $NAME

