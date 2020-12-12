# .bashrc, config for bash
# source: https://github.com/pricheal/dotfiles

# ===================
# prompt
# ===================

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

# ===================
# env vars
# ===================

export EDITOR=nvim
export PAGER='less -S'
export GPG_TTY=$(tty) # fix for git commit signing with gpg
export TERM=xterm-256color # needed for vim color in tmux

# ===================
# aliases
# ===================

alias ls='ls -F --color'
alias less='less -S'

alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# ===================
# misc
# ===================

# path
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin # for pip stuff

# nnn stuff
alias nnn='nnn -cC'
source ~/.config/nnn/quitcd.sh
export NNN_OPENER=~/.config/nnn/plugins/nuke
export NNN_BMS='d:~/dev;D:~/Downloads/;f:~/dev/fitdegree;c:~/.config;n:~/.config/nvim'
export NNN_TRASH=1

# refreshkeys (keychain)
if command -v refreshkeys &> /dev/null; then
    eval $(refreshkeys --eval --if-needed)
fi

# fzf
export FZF_DEFAULT_OPTS='--color=bg+:0' # make background color consistent

# source fzf shell extensions
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # this loads nvm bash_completion

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# fitdegree stuff
FD=~/dev/fitdegree
export PATH=$PATH:$FD/fd-bin/bin
export PATH=$PATH:~/.gem/ruby/2.7.0/bin

