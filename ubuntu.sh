#!/bin/bash

# ubuntu.sh, sets up my ubuntu environment
# source: https://github.com/pricheal/dotfiles

# add pat user with below commands using root user, clone dotfiles repo
# to /home/pat/dotfiles, then run this file

# adduser pat
# usermod -aG sudo pat
# mkdir /home/pat/.ssh
# cp /root/.ssh/authorized_keys /home/pat/.ssh/authorized_keys
# chown -R pat:pat /home/pat/.ssh

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

# install docker
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker # todo: remove if not needed
sudo usermod -aG docker pat
newgrp docker

# install dev tools
brew install tmux
brew install git
brew install vim
brew install less
brew tap xo/xo && brew install usql

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
