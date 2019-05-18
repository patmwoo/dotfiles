# mac.sh, sets up my macos environment
# source: https://github.com/pricheal/dotfiles

# ==================================================
# os config
# ==================================================

# make sure macos is up to date

# finder preferences
#   - set default directory to home
#   - remove unused items from finder sidebar

# dock preferences
#   - enable auto hide/show dock
#   - enable minimize windows into app icon
#   - disable show recent applications

# trackpad preferences
#   - set tracking speed to third to last tick

# keybord preferences
#   - rebind caps lock to escape in modifier keys
#   - disable add period with double space

# mission control preferences
#   - disable auto rearrange of spaces

# enable battery percentage from battery icon on menu bar

# ==================================================
# homebrew, dev tools, apps
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package managers
brew install node
brew install composer

# install tools
brew install git
brew install vim
brew install python # python3

# install gui apps
brew cask install google-chrome
brew cask install filezilla
brew cask install visual-studio-code
brew cask install mysqlworkbench
brew cask install google-backup-and-sync
brew cash install insomnia

# manual installs: 1password x for chrome, microsoft office (from microsoft account),
# logic pro, clearpass onguard

# put installed apps on second page of launch pad

# set dock apps to finder, calendar, notes, reminders, photos, messages, chrome, vs code,
# terminal, system preferences

# ==================================================
# config stuff
# ==================================================

# put .bash_profile and .vimrc in home directory

# git, set global identity info
git config --global user.email "patrickricheal@gmail.com"
git config --global user.name "pricheal"

# set terminal theme to tomorrow-night.terminal
