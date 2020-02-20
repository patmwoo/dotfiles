#!/bin/bash

# mac.sh, macos specific setup stuff
# source: https://github.com/pricheal/dotfiles

# ==============================
# installs
# ==============================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install bash
brew install bash
which bash | sudo tee -a /etc/shells
sudo chsh -s $(which bash) $USER

# install gnu core utils
brew install coreutils

# install docker
brew cask install docker

# install casks
brew cask install google-chrome
brew cask install spotify
brew cask install iterm2
brew cask install slack
brew cask install visual-studio-code
brew cash install insomnia
brew cask install datagrip
brew cask install cyberduck
brew cask install discord
brew cask install 1password-cli

# install mac app store apps
brew install mas
mas install 409201541 # pages
mas install 409203825 # numbers
mas install 409183694 # keynote
mas install 634148309 # logic pro

# install fantasque sans mono
mkdir -p $TMPDIR/fantasque-sans
curl -L https://github.com/belluzj/fantasque-sans/releases/download/v1.7.2/FantasqueSansMono-NoLoopK.tar.gz | tar -x -C $TMPDIR/fantasque-sans
cp $TMPDIR/fantasque-sans/TTF/* ~/Library/Fonts
rm -rf $TMPDIR/fantasque-sans

