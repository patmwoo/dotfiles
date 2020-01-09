#!/bin/bash

# ubuntu.sh, sets up my ubuntu environment
# source: https://github.com/pricheal/dotfiles

# ==================================================
# installs
# ==================================================

# setup homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get update
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile
source ~/.profile

# setup zsh
brew install zsh
echo "emulate sh -c 'source ~/.profile'" >> ~/.zprofile # make zsh run ~/.profile
which zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)

# install docker (from https://docs.docker.com/install/linux/docker-ce/ubuntu/)
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker # todo: remove if not needed
sudo usermod -aG docker pat
newgrp docker

# install docker compose (from https://docs.docker.com/compose/install/)
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install docker sync
gem install docker-sync

# install dev tools
brew install tmux
brew install git
brew install vim
brew install less
brew tap xo/xo && brew install usql
brew install httpie

# install cli stuff
brew install neofetch

# ==================================================
# misc
# ==================================================

# download base16
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# symlink files to home folder
ln -sf ~/dotfiles/.zshrc ~/.zshrc && source ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# generate key bindings for less
lesskey ~/dotfiles/.lesskey

# set shell theme
base16_eighties
