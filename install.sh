#!/bin/bash

# install.sh, sets up dotfiles
# source: https://github.com/pricheal/dotfiles

cd ~/dotfiles

# setup symlinks
ln -sf .bash_profile ~/.bash_profile
ln -sf .bashrc ~/.bashrc
ln -sf .vimrc ~/.vimrc
ln -sf .gitconfig ~/.gitconfig
ln -sf .tmux.conf ~/.tmux.conf
mkdir -p ~/.ssh && ln -sf id_rsa.pub ~/.ssh/id_rsa.pub
mkdir -p ~/.gnupg && ln -sf gnu-agent.conf ~/.gnupg/gnu-agent.conf

# generate key bindings for less
lesskey .lesskey

# set dotfiles git repo remote to ssh
git remote set-url origin git@github.com:pricheal/dotfiles.git
