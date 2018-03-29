# bash.sh, sets up my bash environment
# author: Patrick Richeal
# last modified: 3/28/2018
# source: https://github.com/pricheal/dotfiles

# ==================================================
# shell
# ==================================================

# remove old .bash_profile
rm ~/.bash_profile

# copy new .bash_profile
mv .bash_profile ~/.bash_profile

# ==================================================
# vim
# ==================================================

# remove old vim files
rm ~/.vimrc
rm -rf ~/.vim

# copy new .vimrc
mv .vimrc ~/.vimrc

# ==================================================
# self destruct
# ==================================================

cd ..
rm -rf dotfiles

echo "Setup complete"
