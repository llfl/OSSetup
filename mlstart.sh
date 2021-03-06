#!/bin/bash

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup_color && sudo apt update && sudo apt install -y wget git zsh vim && cd ~ && git clone https://github.com/llfl/OSSetup OSSetuptmp && cd OSSetuptmp && sh ./installohmyzsh.sh --unattended && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && cp ~/.zshrc ~/.zshrc_bak && sed -i '/^plugins/s/)/ zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc && sed -i '/^ZSH_THEME/s/"robbyrussell"/"ys"/' ~/.zshrc && wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash ./Miniconda3-latest-Linux-x86_64.sh -bfp ~/miniconda3 && ~/miniconda3/bin/conda init zsh && ~/miniconda3/bin/conda config --set auto_activate_base false && bash ./setup_docker.sh && bash ./nvidia-driver.sh && cd ~ && rm -rf OSSetuptmp && echo "change the shell to zsh " && chsh -s /bin/zsh && \
printf "${YELLOW}Do you want to reboot? [Y/n]${RESET} "
	read opt
	case $opt in
		y*|Y*|"") echo "Rebooting.";sudo reboot;
		n*|N*) echo "Reboot skipped."; return ;;
		*) echo "Invalid choice. Reboot skipped."; return ;;
	esac