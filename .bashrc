# .bashrc, config for bash
# source: https://github.com/pricheal/dotfiles

# ----- env vars ----- #

export EDITOR=nvim
export PAGER=less
export LESS='-RFS'
export GPG_TTY=$(tty) # fix for git commit signing with gpg
export TERM=xterm-256color # needed for vim color in tmux
export BAT_THEME='base16' # default theme for bat

# source encrypted vars from ~/.env file
set -o allexport; source ~/.env; set +o allexport

# ----- aliases ----- #

alias ls='ls -F --color'

# ----- prompt ----- #

# source git prompt
source /usr/share/git/completion/git-prompt.sh

# git ps1 options
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

# disable python virtual env prompt so we can add it to our custom
# prompt ourselves (our prompt starts with a \n so anything prepended
# is sort of inherently broken)
export VIRTUAL_ENV_DISABLE_PROMPT=1

# function to print info about python virtual env
function venv_info() {
    if [ -z "$VIRTUAL_ENV" ]; then
        echo ""
    else
        echo "($(basename $VIRTUAL_ENV)) "
    fi
}

export PS1='\n$(venv_info)\e[0;32m\u@\h\e[m \w $(__git_ps1 "(%s)")\n$ '

# ----- nnn ----- #

alias nnn='nnn -cC'
source ~/.config/nnn/quitcd.sh
export NNN_OPENER=~/.config/nnn/plugins/nuke
export NNN_BMS='d:~/dev;D:~/Downloads/;f:~/dev/fitdegree;c:~/.config;n:~/.config/nvim'
export NNN_TRASH=1

# copied from .config/nnn/quitcd.sh, without this, nnn inside nvim won't
# change directories properly unless 'n' has been ran once before opening
# nvim
export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

# ----- fzf ----- #

export FZF_DEFAULT_OPTS='--color=bg+:0' # make background color consistent

# source fzf shell extensions
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# ----- misc ----- #

# path
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin # for pip stuff
export PATH=$PATH:/usr/share/git/diff-highlight # for git diff-highlight script
export PATH=$PATH:~/.rvm/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # this loads nvm bash_completion

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# refreshkeys (keychain)
if command -v refreshkeys &> /dev/null; then
    eval $(refreshkeys --eval --if-needed)
fi

# fitdegree stuff
FD=~/dev/fitdegree
alias fit=$FD/scripts/fd-cli/bin/fd

