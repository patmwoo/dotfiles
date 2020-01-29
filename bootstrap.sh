#!/bin/bash

# bootstrap.sh, sets up unix dev environment
# source: https://github.com/pricheal/dotfiles

# ==============================
# os specific stuff
# ==============================

if [ "$(uname -s)" == "Darwin" ]; then
    source ~/dotfiles/mac.sh
elif [ "$(uname -s)" == "Linux" ]; then
    source ~/dotfiles/ubuntu.sh
fi

# ==============================
# installs
# ==============================

# install docker sync
brew install ruby
gem install docker-sync

# install dev tools
brew install tmux
brew install git
brew install vim
brew install less
brew install httpie
brew install jq
brew install mosh

# install cli stuff
brew install neofetch

# ==============================
# setup
# ==============================

# symlink files to home folder
ln -sf ~/dotfiles/.bashrc ~/.bashrc && source ~/.bashrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/ssh-config ~/.ssh/config

# generate key bindings for less
lesskey ~/dotfiles/.lesskey

