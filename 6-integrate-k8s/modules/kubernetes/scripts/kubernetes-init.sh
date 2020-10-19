#!/bin/bash
  
sudo apt-get update 
# sudo hostname k8s-manage
sudo apt-get update
sudo apt-get install -y unzip python

curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
unzip awscli-bundle.zip

sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

rm -rf awscli-bundle 
rm awscli-bundle.zip 
 
sudo su -
mkdir ~/.kube 
cp /home/ubuntu/.kube/config ~/.kube

export KOPS_STATE_STORE="s3://${KOPS_STATE_BUCKET}"
