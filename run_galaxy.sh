#! /bin/bash 

NAME=ifbgalaxy
PORT=8080


if [ $(docker ps -a | grep -c galaxy-store) -eq 0 ]; then
	echo "Create galaxy volume"
	docker create -v /export --name galaxy-store  bgruening/galaxy-stable  /bin/true
else
	echo "Galaxy volume already exists."
fi

docker stop $NAME
docker rm -v $NAME

#	--net=host \
#	--privileged=true \
#	-e DOCKER_PARENT=True \
#    	-v /var/run/docker.sock:/var/run/docker.sock \
echo "Run galaxy-docker "
docker run -d \
	-p $PORT:80 -p 8021:21 -p 8800:8800 \
	-v /var/log/galaxy-docker:/home/galaxy/logs \
	-e GALAXY_CONFIG_SUPPORT_URL=https://cloud.france-bioinformatique.fr/cloud/help/ \
	-e GALAXY_CONFIG_USE_REMOTE_USER=True \
	-e GALAXY_CONFIG_REQUIRE_LOGIN=True \
	-e GALAXY_CONFIG_FTP_UPLOAD_DIR=/ifb/galaxy/database/files \
	-e GALAXY_CONFIG_FTP_UPLOAD_SITE=cloud.france-bioinformatique.fr \
	--volumes-from galaxy-store \
	--name $NAME \
	bgruening/galaxy-stable

echo -e "\n\n"
sleep 5s
docker ps

