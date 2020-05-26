#!/bin/bash

# install.sh, sets up dotfiles
# source: https://github.com/pricheal/dotfiles

cd ~/dotfiles

# setup symlinks
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.ssh && ln -sf ~/dotfiles/id_rsa.pub ~/.ssh/id_rsa.pub
mkdir -p ~/.gnupg && ln -sf ~/dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# generate key bindings for less
lesskey .lesskey

# set dotfiles git repo remote to ssh
git remote set-url origin git@github.com:pricheal/dotfiles.git
