#!/bin/bash

docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
# yes | docker volume prune

DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up


# sudo wget -O /usr/src/google-chrome-stable_current_amd64.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
# sudo dpkg -i /usr/src/google-chrome-stable_current_amd64.deb
# sudo apt-get install -f -y
# sudo rm -f /usr/src/google-chrome-stable_current_amd64.deb