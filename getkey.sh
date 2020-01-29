#!/bin/bash

# getkey.sh, script to retrieve private ssh key, should be sourced on linux to
# start working in the current shell
# source: https://github.com/pricheal/dotfiles

eval $(op signin my patrickricheal@gmail.com)
op get document $(op list documents | jq -r '.[] | select(.overview.title == "SSH private key") | .uuid') > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# ssh-add -K stores private key passphrase in keychain on macos
if [ "$(uname -s)" == "Darwin" ]; then
    eval $(ssh-agent -s)
    ssh-add -K
elif [ "$(uname -s)" == "Linux" ]; then
    
fi
