#!/bin/bash

sudo apt update && sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

if [ "$1" = 'docker' ] || [ "$1" = 'd' ]; then
    bash ./setup_docker.sh
fi

# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
# sudo apt-get update
# sudo apt-get install -y kubelet kubeadm kubectl

curl -fsSL https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

sudo echo "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main" >>/etc/apt/sources.list.d/docker-k8s.list



sudo apt update && sudo apt install -y kubelet kubeadm kubectl

swapoff -a
#vim /etc/fstab


if [ "$1" = 'master' ] || [ "$1" = 'm' ]; then
    sudo sed -i "s/cgroup-driver=systemd/cgroup-driver=cgroupfs/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    sudo systemctl daemon-reload
    sudo systemctl restart kubelet
fi
