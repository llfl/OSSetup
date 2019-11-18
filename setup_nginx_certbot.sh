#!/bin/bash

CERTBOT='yes'
sudo apt install nginx 

if [ $1 = "nocertbot" or $1 = "nc"]; then
    CERTBOT='no'
fi

if [ $CERTBOT = "yes" ]; then
    sudo apt-get update &&\
    sudo apt-get install software-properties-common &&\
    sudo add-apt-repository universe &&\
    sudo add-apt-repository ppa:certbot/certbot &&\
    sudo apt-get update &&\
    sudo apt-get install certbot python-certbot-nginx &&\
fi
