#!/bin/bash

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp ~/.zshrc ~/.zshrc_bak

sed -i '/^plugins/s/)/ zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
sed -i '/^ZSH_THEME/s/"robbyrussell"/"ys"/' ~/.zshrc

source ~/.zshrc