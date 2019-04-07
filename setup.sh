#!/bin/bash

apt install -y wget

if [ $1 = "zsh" or $1 = "all"]; then
    bash ./setup_zsh.sh
fi

if [ $1 = "anaconda" or $1 = "all"]; then
    bash ./setup_anaaconda.sh
fi

if [ $1 = "docker" or $1 = "all"]; then
    bash ./setup_docker.sh
fi