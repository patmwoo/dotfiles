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
# base16
# ==============================

# from https://github.com/chriskempson/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# ==============================
# fitdegree stuff
# ==============================

FD=~/dev/fitdegree
export PATH=$PATH:$FD/scripts/bin
