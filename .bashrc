# .bashrc, config for bash
# source: https://github.com/pricheal/dotfiles

# ==============================
# general
# ==============================

# set editor var
export EDITOR=vim

# ==============================
# aliases 
# ==============================

alias ls='ls -F --color'
alias less='less -S'

# ==============================
# completion
# ==============================

source $(brew --prefix)/etc/bash_completion
complete -d cd

# ==============================
# fitdegree stuff
# ==============================

FD=~/dev/fitdegree
export PATH=$PATH:$FD/scripts/bin

# ==============================
# misc
# ==============================

if [ "$(uname)" = "Darwin" ]; then
    # make it so core utils are before default bsd utils in path
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
elif [ "$(uname)" = "Linux" ]; then
    # needed for linux brew to work
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
