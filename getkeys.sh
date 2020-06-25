#!/bin/bash

# getkey.sh, script to retrieve private keys
# source: https://github.com/pricheal/dotfiles

# login to 1password cli
eval $(op signin my patrickricheal@gmail.com)

# get ssh private key
op get document $(op list documents | jq -r '.[] | select(.overview.title == "SSH private key") | .uuid') > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# get gpg private key
op get document $(op list documents | jq -r '.[] | select(.overview.title == "GPG private key") | .uuid') > ~/.gnupg/gpg-private.key
gpg --import ~/.gnupg/gpg-private.key
rm ~/.gnupg/gpg-private.key
