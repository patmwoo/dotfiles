# .profile, profile for login shells
# source: https://github.com/pricheal/dotfiles

# if running bash, source bashrc
if [ -n "$BASH_VERSION" ]; then
    source ~/.bashrc
fi

# if linux, start keychain
if [ "$(uname -s)" == "Linux" ]; then
    keychain ~/.ssh/id_rsa
    source ~/.keychain/$HOSTNAME-sh
fi
