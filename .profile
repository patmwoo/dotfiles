# .profile, profile for login shells
# source: https://github.com/pricheal/dotfiles

# if running bash, source bashrc
if [ -n "$BASH_VERSION" ]; then
    source ~/.bashrc
fi

# if linux, source keychain
if [ "$(uname -s)" == "Linux" ] && [ -f ~/.keychain/$HOSTNAME-sh ]; then
    source ~/.keychain/$HOSTNAME-sh
fi
