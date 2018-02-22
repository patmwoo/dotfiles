# setup.sh, sets up my shell environment and then self destructs, should be
#  ran inside the git repo
# author: Patrick Richeal
# last modified: 2/22/2018
# source: https://github.com/pricheal/dotfiles

# ==================================================
# .bashrc
# ==================================================

# remove old .bashrc
rm ~/.bashrc

# copy new .basrc
mv .bashrc ~/.bashrc

# ==================================================
# vim
# ==================================================

# remove old vim files
rm ~/.vimrc
rm -rf ~/.vim

# copy new .vimrc
mv .vimrc ~/.vimrc

# install vim-airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline

# ==================================================
# self destruct
# ==================================================

cd ..
rm -rf dotfiles

echo "Setup complete"
