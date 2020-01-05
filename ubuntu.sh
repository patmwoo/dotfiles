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

# install homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get update
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile

# setup zsh
apt install zsh
chsh -s /usr/bin/zsh

# install dev tools
apt install tmux
apt install git
apt install vim
apt install less
#brew tap xo/xo && brew install usql

# install languages
#brew install python

# install package managers
#brew install node
#brew install composer

# install cli stuff
#brew install rigellute/tap/spotify-tui
#brew install neofetch

# install gui apps
#brew cask install google-chrome
#brew cask install spotify
#brew cask install iterm2
#brew cask install slack
#brew cask install visual-studio-code
#brew cash install insomnia
#brew cask install datagrip
#brew cask install cyberduck
#brew cask install discord

# ==================================================
# config
# ==================================================

# symlink files to home folder
#ln -sf ~/dotfiles/.zshrc ~/.zshrc && source ~/.zshrc
#ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
#ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# generate key bindings for less
#lesskey ~/dotfiles/.lesskey

# set shell theme
#base16_eighties
