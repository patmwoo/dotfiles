# aliases.sh, my aliases
# source: https://github.com/pricheal/dotfiles

# general aliases
if [ "$(uname)" = "Darwin" ]; then # macos
    alias ls='ls -GF'
elif [ "$(uname)" = "Linux" ]; then # linux
    alias ls='ls -F --color'
fi
alias less='less -S'

# quick nav aliases
alias dev='cd ~/dev/'
alias docroot='cd /usr/local/var/www'
alias fd='cd ~/dev/fitdegree'
