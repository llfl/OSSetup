#!/bin/bash

sudo apt install -y curl vim

curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun

sudo groupadd docker
sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker