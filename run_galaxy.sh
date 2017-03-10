#! /bin/bash

NAME=ifbgalaxy
VERSION=16.10
PORT=8080
USER=$USER


# if [ $(docker ps -a | grep -c galaxy-store) -eq 0 ]; then
#         echo "Create galaxy volume"
#         docker create -v /export --name galaxy-store  bgruening/galaxy-stable:$VERSION  /bin/true
# else
#         echo "Galaxy volume already exists."
# fi

docker stop $NAME
docker rm -v $NAME

#       --net=host \
#       --privileged=true \
#       -e DOCKER_PARENT=True \
#       -v /var/run/docker.sock:/var/run/docker.sock \
echo "Run galaxy-docker "
docker run -d \
        -p $PORT:80 -p 8021:21 -p 8800:8800 \
        -v /root/conf.d:/etc/nginx/conf.d:ro \
	-e GALAXY_CONFIG_SUPPORT_URL=https://cloud.france-bioinformatique.fr/cloud/help/ \
        -e GALAXY_CONFIG_USE_REMOTE_USER=True \
	-e GALAXY_DEFAULT_ADMIN_USER=$USER \
	-e GALAXY_CONFIG_ADMIN_USERS=$USER \
        --name $NAME \
        bgruening/galaxy-stable:$VERSION

	#-e GALAXY_LOGGING=full \

#        -v /root/data-galaxy:/export \
#        -e GALAXY_CONFIG_FTP_UPLOAD_SITE=cloud.france-bioinformatique.fr \
#        -e GALAXY_CONFIG_REQUIRE_LOGIN=True \
#        -e GALAXY_CONFIG_FTP_UPLOAD_DIR=/root/data-galaxy/database/files \
#        --volumes-from galaxy-store \
#        -v /var/log/galaxy-docker:/home/galaxy/logs \

echo -e "\n\n"
sleep 5s
docker ps

echo -e "\n\n"
docker logs -f $NAME

