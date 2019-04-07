#!/bin/bash

apt install -y wget

if [ $1 = "zsh" or $1 = "all"]; then
    bash ./setup_zsh.sh
fi

if [ $1 = "anaconda" or $1 = "all"]; then
    bash ./setup_anaconda.sh
fi

if [ $1 = "docker" or $1 = "all"]; then
    bash ./setup_docker.sh
fi

if [ $1 = "tuna" or $1 = "all"]; then
    wget https://tuna.moe/oh-my-tuna/oh-my-tuna.py
    python oh-my-tuna.py
fi