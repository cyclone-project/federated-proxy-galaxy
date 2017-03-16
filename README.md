# federated-proxy-galaxy


```shell

export DEAMON_OR_ITERACTIVE=it
export ALLOWED_EMAIL_SPACE_SEPARATED_VALUES="admin-galaxy@no.where user-galaxy@space.oddity"

#don't forget to adujst TARGET_FQDN, TARGET_PORT, and TARGET_PATH
export TARGET_PATH=/
```

If you use a local installation of Galaxy from archive : https://github.com/galaxyproject/galaxy/archive
also you need set **use_remote_user = True in galaxy.ini** file and set this variable to use *galaxy-local-proxy.conf*.

```shell
export GALAXY_DOCKER_USED=false

./startFilteringProxy.sh
```

If you use a docker Galaxy images from  https://github.com/bgruening/docker-galaxy-stable
also you need set this variable to use *galaxy-docker-proxy.conf*.

``` shell

export GALAXY_DOCKER_USED=true

./startFilteringProxy.sh

export ADMIN_USER="admin-galaxy@no.where"

./run_galaxy_docker.sh
```

