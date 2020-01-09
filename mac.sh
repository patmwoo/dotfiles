#!/bin/zsh

# mac.sh, sets up my macos environment
# source: https://github.com/pricheal/dotfiles

# ==================================================
# installs
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install dev tools
brew install tmux
brew install git
brew install vim
brew install less
brew tap xo/xo && brew install usql

# install docker stuff
brew cask install docker
sudo gem install docker-sync

# install languages
brew install python

# install package managers
brew install node
brew install composer

# install cli stuff
brew install rigellute/tap/spotify-tui
brew install neofetch

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
