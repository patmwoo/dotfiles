# .bashrc, config for bash
# source: https://github.com/pricheal/dotfiles

# set prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\n\e[0;32m\u@\h\e[m \w $(__git_ps1 "(%s)")\n$ '

# set editor var
export EDITOR=vim
export PAGER='less -S'

# aliases
alias ls='ls -F --color'
alias less='less -S'

# fitdegree stuff
FD=~/dev/fitdegree
export PATH=$PATH:$FD/scripts/bin
