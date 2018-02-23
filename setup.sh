# setup.sh, sets up my shell environment and then self destructs, should be
#  ran inside the git repo
# author: Patrick Richeal
# last modified: 2/22/2018
# source: https://github.com/pricheal/dotfiles

# ==================================================
# shell
# ==================================================

# remove old .bash_profile
rm ~/.bash_profile

# copy new .bash_profile
mv .bash_profile ~/.bash_profile

# install base16-shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# ==================================================
# vim
# ==================================================

# remove old vim files
rm ~/.vimrc
rm -rf ~/.vim

# copy new .vimrc
mv .vimrc ~/.vimrc

# install vim-airline and themes
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes

# ==================================================
# self destruct
# ==================================================

cd ..
rm -rf dotfiles

echo "Setup complete"
