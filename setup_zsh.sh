#!/bin/bash

sudo apt install zsh

sudo chsh -s $(which zsh)

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"