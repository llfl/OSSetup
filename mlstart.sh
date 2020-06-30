#!/bin/bash

sudo apt update && sudo apt install -y wget git zsh vim && cd ~ && git clone https://github.com/llfl/OSSetup && cd OSSetup && sh ./installohmyzsh.sh --unattended && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && cp ~/.zshrc ~/.zshrc_bak && sed -i '/^plugins/s/)/ zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc && sed -i '/^ZSH_THEME/s/"robbyrussell"/"ys"/' ~/.zshrc && wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash ./Miniconda3-latest-Linux-x86_64.sh -bfp ~/miniconda3 && ~/miniconda3/bin/conda init zsh && bash ./setup_docker.sh && bash ./nvidia-driver.sh 