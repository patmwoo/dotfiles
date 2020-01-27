# .profile, profile for login shells
# source: https://github.com/pricheal/dotfiles

# ==============================
# aliases 
# ==============================

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# start up ssh agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# needed so linux brew works
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
