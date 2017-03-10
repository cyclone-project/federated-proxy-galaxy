Pour construire l'image de Galaxy, il faut :

git clone https://github.com/bgruening/docker-galaxy-stable.git

cd docker-galaxy-stable/galaxy/roles/galaxy-postgresql 
git clone https://github.com/galaxyproject/ansible-postgresql.git .
git checkout 8eec423577aea5e9476c984f164a0d1c76db6a1f

cd ../galaxyprojectdotorg.galaxyextras
git clone https://github.com/galaxyproject/ansible-galaxy-extras.git .
git checkout 6d97ac73456c4be2ba0e1faf9d5d5ac18903764f


Change le Dockerfile
cd ../../..

docker build -t mygala:0 .


Puis lancer le script run_galaxy.sh avec les bonnes variables.

