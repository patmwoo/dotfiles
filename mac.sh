#!/bin/bash

# mac.sh, macos specific setup stuff
# source: https://github.com/pricheal/dotfiles

# ==================================================
# installs
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install bash
brew install bash
which bash | sudo tee -a /etc/shells
chsh -s $(which bash)

# install docker
brew cask install docker

# install gui apps
brew cask install google-chrome
brew cask install spotify
brew cask install iterm2
brew cask install slack
brew cask install visual-studio-code
brew cash install insomnia
brew cask install datagrip
brew cask install cyberduck
brew cask install discord

# ==================================================
# misc
# ==================================================

# install fonts
brew tap homebrew/cask-fonts
brew cask install font-ubuntu
