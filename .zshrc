# .zshrc, config for zsh
# source: https://github.com/pricheal/dotfiles

# general aliases
alias ls='ls -GF'

# quick nav aliases
alias dev='cd ~/dev/'
alias docroot='cd /usr/local/var/www'
alias fd='cd ~/dev/fitdegree'

# prompt
PROMPT="
%n@%m %~
%# "

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# enable vi mode, fix esc delay
bindkey -v
export KEYTIMEOUT=1
