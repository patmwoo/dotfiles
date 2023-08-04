# .bashrc, config for bash
# source: https://github.com/katmfoo/dotfiles

# ----- env vars ----- #

export EDITOR=nvim
export PAGER=less
export LESS='-RFS'
export GPG_TTY=$(tty)

# source encrypted vars from ~/.env file
[ -f ~/.env ] && set -o allexport && source ~/.env && set +o allexport

# ----- aliases ----- #

alias ls='ls -F --color'

# ----- prompt ----- #

# source git prompt
source /opt/homebrew/opt/git/etc/bash_completion.d/git-prompt.sh

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

export PS1='\n$(venv_info)\e[0;32m\u@mailbox\e[m \w $(__git_ps1 "(%s)")\n$ '

# ----- nnn ----- #

alias nnn='nnn -C'
source ~/.config/nnn/quitcd.sh
export NNN_BMS='f:~/dev/fitdegree'
export NNN_TRASH=1

# ----- misc ----- #

# path
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin # for pip stuff
export PATH=$PATH:~/.rvm/bin
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # this loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # this loads nvm bash_completion

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# fitdegree stuff
FD=~/dev/fitdegree
alias fit=$FD/scripts/fd-cli/bin/fit
alias fddb="mysql $DB_FD_DEV fddb"

