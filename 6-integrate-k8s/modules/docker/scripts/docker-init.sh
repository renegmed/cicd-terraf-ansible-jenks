#!/bin/bash

 
sudo useradd -p $(openssl passwd -1 "${DOCKER_PASSWORD}") -m ${DOCKER_USER} -s /bin/bash

sudo echo "${DOCKER_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo su - ${DOCKER_USER}

sudo apt-get update 

# install docker 
sudo apt-get remove -y docker docker-engine docker.io
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker ${DOCKER_USER}

# to check $> id ${DOCKER_USER}

sudo chmod 666 /var/run/docker.sock

sudo systemctl start docker
sudo systemctl enable docker

docker --version 
 
sudo sed -i 's/#   PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd reload

mkdir /home/${DOCKER_USER}/.ssh
ssh-keygen -b 2048 -t rsa -f /home/${DOCKER_USER}/.ssh/id_rsa -P "" -q
sudo chown -R ${DOCKER_USER}:${DOCKER_USER} /home/${DOCKER_USER}/.ssh/
  
