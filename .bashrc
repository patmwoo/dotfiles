# .bashrc, config for bash
# source: https://github.com/pricheal/dotfiles

# platform dependent stuff
if [ "$(uname)" = "Darwin" ]; then
    # make it so core utils are before default bsd utils in path
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
elif [ "$(uname)" = "Linux" ]; then
    # needed for linux brew to work (also has to be before brew
    # --prefix below)
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# source bash completion (needs to be before git ps1)
source $(brew --prefix)/etc/bash_completion

# set prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\n\e[0;32m\u@\h\e[m \w $(__git_ps1 "(%s)")\n$ '

# set editor var
export EDITOR=vim

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# aliases
alias ls='ls -F --color'
alias less='less -S'

# fitdegree stuff
FD=~/dev/fitdegree
export PATH=$PATH:$FD/scripts/bin
