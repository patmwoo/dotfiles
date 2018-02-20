# setup.sh, last modified 2/20/2018
# symlinks a list of files to the home directory and runs each one
# will remove any file that already exists

# list of files
files=".bash_profile"

for file in $files; do
  rm ~/$file
  echo "Creating symlink to $file in home directory"
  ln -s $(pwd)/$file ~/$file
  echo "Execurting $file in home directory"
  source ~/$file
done

echo "Setup complete"
