#!/bin/bash

sudo apt update && sudo apt install -y ubuntu-drivers-common &&\
sudo ubuntu-drivers autoinstall && nvidia-smi 

