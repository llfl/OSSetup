#!/bin/bash

sudo apt update && sudo apt install -y ubuntu-drivers-common &&\
sudo ubuntu-drivers autoinstall && echo "nvidia driver install successed but you have to reboot for use"

