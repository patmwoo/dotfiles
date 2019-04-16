# .bash_profile, config for bash shell 
# author: Patrick Richeal
# source: https://github.com/pricheal/dotfiles

# ==================================================
# aliases
# ==================================================

# general aliases
alias ls='ls -GF'

 # quick nav aliases
 alias docroot='cd /usr/local/var/www'
 alias fdapp='cd ~/Documents/fitdegree/fd-app'
 alias fdapi='cd /usr/local/var/www/fd-api/'
 alias fdadmin='cd ~/Documents/fitdegree/fd-admin'
 alias fdwidget='cd ~/Documents/fitdegree/fd-widget'
 alias fdotg='cd ~/Documents/fitdegree/fd-onthego'
 alias fdnpm='cd ~/Documents/fitdegree/fd-npm'
 alias fdkiosk='cd ~/Documents/fitdegree/fd-kiosk'

# ==================================================
# prompt
# ==================================================

export PS1="\n\[\e[0;33m\]\w \[\e[0;37m\]\n$ \[\e[0m\]"
