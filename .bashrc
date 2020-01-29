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

if [ "$(uname)" = "Darwin" ]; then # macos
    alias ls='ls -GF'
elif [ "$(uname)" = "Linux" ]; then # linux
    alias ls='ls -F --color'
fi
alias less='less -S'

# ==============================
# completion
# ==============================

complete -d cd

# ==============================
# fitdegree stuff
# ==============================

FD=~/dev/fitdegree
export PATH=$PATH:$FD/scripts/bin

# ==============================
# misc
# ==============================

# needed so linux brew works (only on linux)
if [ "$(uname)" = "Linux" ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
