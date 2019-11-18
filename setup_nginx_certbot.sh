#!/bin/bash


sudo apt install -y nginx && sudo apt-get update &&\
    sudo apt-get install -y software-properties-common &&\
    sudo add-apt-repository universe &&\
    sudo add-apt-repository ppa:certbot/certbot &&\
    sudo apt-get update &&\
    sudo apt-get install -y certbot python-certbot-nginx &&\

