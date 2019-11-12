# .zshrc, config for zsh
# source: https://github.com/pricheal/dotfiles

# general aliases
alias ls='ls -GF'

# quick nav aliases
alias docroot='cd /usr/local/var/www'
alias fd='cd ~/dev/fitdegree'
alias fdapp='cd ~/dev/fitdegree/clients/apps/app'
alias fdapi='cd ~/dev/fitdegree/api'
alias fdadmin='cd ~/dev/fitdegree/clients/apps/admin'
alias fdwidgets='cd ~/dev/fitdegree/clients/apps/widgets'
alias fdotg='cd ~/dev/fitdegree/clients/apps/onthego'
alias fdkiosk='cd ~/dev/fitdegree/clients/apps/kiosk'

# prompt
PROMPT="
%n@%m %~
%# "

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
