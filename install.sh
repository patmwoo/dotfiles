#!/bin/bash

# install.sh, loose notes for macos system install
# source: https://github.com/katmfoo/dotfiles

# next time you do a fresh macos system install, refine this

# install homebrew

# bash
brew install bash
brew install bash-completion@2 # is this necessary?
# configure bash as default shell

# does 'brew install docker' work?
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask beekeeper-studio
brew install --cask google-chrome
brew install --cask slack

# install fantasque

# core stuffs
brew install git curl ripgrep jq zip unzip httpie htop trash

# tool stuffs
brew install yadm neovim nnn tmux http-prompt mysql-client redis \
    sops git-delta neofetch

# language stuffs
brew install nvm
nvm install 16
nvm alias default 16
brew install php composer
# is default python okay?

# dotfiles
yadm clone --no-bootstrap https://github.com/katmfoo/dotfiles.git
