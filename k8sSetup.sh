#!/bin/bash

sudo apt update && sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

if [ "$1" = 'docker' ] || [ "$1" = 'd' ]; then
    bash ./setup_docker.sh
    
fi

sudo touch /etc/docker/daemon.json
sudo cat > /etc/docker/daemon.json <<EOF
        {
          "exec-opts": ["native.cgroupdriver=systemd"],
          "log-driver": "json-file",
          "log-opts": {
            "max-size": "100m"
          },
          "storage-driver": "overlay2"
        }
EOF

sudo mkdir -p /etc/systemd/system/docker.service.d

# Restart docker.
sudo systemctl daemon-reload
sudo systemctl restart docker


# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
# sudo apt-get update
# sudo apt-get install -y kubelet kubeadm kubectl

curl -fsSL https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

# sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
# deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
# EOF
sudo apt-add-repository "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main"

sudo apt update && sudo apt install -y kubelet kubeadm kubectl

for  i  in  `kubeadm config images list`;  do
    imageName=${i#k8s.gcr.io/}
    docker pull registry.aliyuncs.com/google_containers/$imageName
    docker tag registry.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    docker rmi registry.aliyuncs.com/google_containers/$imageName
done;

sudo swapoff -a
#vim /etc/fstab


if [ "$1" = 'master' ] || [ "$1" = 'm' ]; then
    sudo kubeadm init --pod-network-cidr=10.244.0.0/16
    kubectl apply -f https://git.io/weave-kube-1.6
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml
fi
