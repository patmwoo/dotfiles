#!/bin/bash

# getkey.sh, script to retrieve private ssh key
# source: https://github.com/pricheal/dotfiles

eval $(op signin my patrickricheal@gmail.com)
op get document $(op list documents | jq -r '.[] | select(.overview.title == "SSH private key") | .uuid') > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

if [ "$(uname -s)" == "Darwin" ]; then
    eval $(ssh-agent -s)
    ssh-add -K
elif [ "$(uname -s)" == "Linux" ]; then
    keychain ~/.ssh/id_rsa    
fi
