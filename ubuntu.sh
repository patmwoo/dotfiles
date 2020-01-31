#!/bin/bash

# ubuntu.sh, ubuntu specific setup stuff
# source: https://github.com/pricheal/dotfiles

# ==============================
# installs
# ==============================

# install homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get update
sudo apt-get -y install build-essential
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# install docker (from https://docs.docker.com/install/linux/docker-ce/ubuntu/)
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# install docker compose (from https://docs.docker.com/compose/install/)
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install 1password cli
curl -L https://cache.agilebits.com/dist/1P/op/pkg/v0.8.0/op_linux_amd64_v0.8.0.zip -o ~/op.zip
sudo apt-get -y install unzip
unzip ~/op.zip -d ~/op
sudo mv ~/op/op /usr/local/bin/op
rm -rf ~/op ~/op.zip

# install keychain
sudo apt-get -y install keychain

# ==============================
# config
# ==============================

timedatectl set-timezone America/New_York
