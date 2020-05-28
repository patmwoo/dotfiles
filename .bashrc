# .bashrc, config for bash
# source: https://github.com/pricheal/dotfiles

# source git prompt
source /usr/share/git/completion/git-prompt.sh

# prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\n\e[0;32m\u@\h\e[m \w $(__git_ps1 "(%s)")\n$ '

# env vars
export EDITOR=vim
export PAGER='less -S'
export GPG_TTY=$(tty) # fix for git commit signing with gpg
export TERM=xterm-256color # needed for vim color in tmux

# aliases
alias ls='ls -F --color'
alias less='less -S'

# keychain
eval $(keychain --eval --quiet --agents "ssh,gpg" id_rsa 2A70B83FD3493624)

# for pip stuff
export PATH=$PATH:~/.local/bin

# fitdegree stuff
FD=~/dev/fitdegree
export PATH=$PATH:$FD/scripts/bin
export PATH=$PATH:~/.gem/ruby/2.7.0/bin
