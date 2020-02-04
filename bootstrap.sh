#!/bin/bash

# bootstrap.sh, sets up unix dev environment
# source: https://github.com/pricheal/dotfiles

if [ "$(uname -s)" == "Darwin" ]; then
    source ~/dotfiles/mac.sh
elif [ "$(uname -s)" == "Linux" ]; then
    source ~/dotfiles/ubuntu.sh
fi

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

# install misc stuff
brew install neofetch

# install completion stuff
brew install bash-completion
brew install docker-completion
sudo curl -L https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/tmux.completion.bash -o $(brew --prefix)/etc/bash_completion.d/tmux

# install base16 shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# symlink files to home folder
ln -sf ~/dotfiles/.bashrc ~/.bashrc && source ~/.bashrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/ssh-config ~/.ssh/config
ln -sf ~/dotfiles/id_rsa.pub ~/.ssh/id_rsa.pub

# generate key bindings for less
lesskey ~/dotfiles/.lesskey
