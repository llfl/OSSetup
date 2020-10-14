#!/bin/bash
CONDA_VERSION=Miniconda3-latest-Linux-x86_64.sh
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/$CONDA_VERSION &&\
bash ./$CONDA_VERSION -bfp ~/miniconda3 &&\
~/miniconda3/bin/conda init zsh &&\
~/miniconda3/bin/conda config --set auto_activate_base false