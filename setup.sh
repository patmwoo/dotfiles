# setup.sh, last modified 2/21/2018
# symlinks a list of files, will remove any file that already exists

# list of files
files=".bash_profile .vimrc"

for file in $files; do
  rm ~/$file
  echo "Creating symlink to $file in home directory"
  ln -s $(pwd)/$file ~/$file
done

echo "Setup complete"
