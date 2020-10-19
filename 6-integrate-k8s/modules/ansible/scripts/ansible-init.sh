#!/bin/bash

#sudo hostname ansible-control-node
sudo apt-get update 
sudo apt-get install -y python python-pip
sudo pip install ansible

sudo mkdir /etc/ansible
# sudo useradd ${ANSIBLE_USER} 
# sudo passwd ${ANSIBLE_PASSWORD}  
# sudo useradd -p $(openssl passwd -1 "${ANSIBLE_PASSWORD}") "${ANSIBLE_USER}"
sudo useradd -p $(openssl passwd -1 "${ANSIBLE_PASSWORD}") -m ${ANSIBLE_USER} -s /bin/bash

sudo echo "${ANSIBLE_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo su - ${ANSIBLE_USER}

# ssh-keygen
# ssh-copy-id ansadmin@<target-server>

# install docker 
apt-get remove -y docker docker-engine docker.io
apt install -y docker.io
groupadd docker
usermod -aG docker ${ANSIBLE_USER}
chmod 666 /var/run/docker.sock
sudo systemctl start docker
sudo systemctl enable docker
docker --version  

# Replace line/ Remove and Insert line on /etc/ssh/sshd_config
#  PasswordAuthentication yes 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd reload

sudo mkdir /opt/kubernetes
sudo chown -R ${ANSIBLE_USER}:${ANSIBLE_USER} /opt/kubernetes

mkdir /home/${ANSIBLE_USER}/.ssh
ssh-keygen -b 2048 -t rsa -f /home/${ANSIBLE_USER}/.ssh/id_rsa -P "" -q
sudo chown -R ${ANSIBLE_USER}:${ANSIBLE_USER} /home/${ANSIBLE_USER}/.ssh/

# TODO
# ssh-copy-id ${ANSIBLE_USER}@localhost
# ssh-copy-id ubuntu@<docker-host ip addr>

 
 
  
