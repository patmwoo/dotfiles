# .bash_profile, config for bash shell 
# source: https://github.com/pricheal/dotfiles

# general aliases
alias ls='ls -GF'

# quick nav aliases
alias docroot='cd /usr/local/var/www'
alias fdapp='cd ~/Documents/fitdegree/fd-app'
alias fdapi='cd /usr/local/var/www/fd-api/'
alias fdadmin='cd ~/Documents/fitdegree/fd-admin'
alias fdwidgets='cd ~/Documents/fitdegree/fd-widgets'
alias fdotg='cd ~/Documents/fitdegree/fd-onthego'
alias fdnpm='cd ~/Documents/fitdegree/fd-npm'
alias fdkiosk='cd ~/Documents/fitdegree/fd-kiosk'

# prompt
export PS1="\n$ "

# git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# add brew alternate formulas to path
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
