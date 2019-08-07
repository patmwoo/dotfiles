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
#   - set both key repeat and delay until repeat to second to last tick
#   - rebind caps lock to escape in modifier keys
#   - disable add period with double space

# mission control preferences
#   - disable auto rearrange of spaces

# notification settings
#   - turn off show notification preview for messages

# enable battery percentage from battery icon on menu bar

# manually remove downloads from dock

# ==================================================
# homebrew, dev tools, apps
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package managers
brew install node@10
brew install composer

# install tools
brew install git
brew install vim
brew install python # python3

# install gui apps
brew cask install google-chrome
brew cask install spotify
brew cask install slack
brew cask install visual-studio-code
brew cask install iterm2
brew cash install insomnia
brew cask install mysqlworkbench
brew cask install cyberduck
brew cask install google-backup-and-sync
brew cask install discord

# manual installs: 1password x for chrome, logic pro, microsoft office (from microsoft account,
# need to manually uninstall onenote and onedrive afterwards)

# put installed apps on second page of launch pad

# set dock apps to finder, calendar, notes, reminders, photos, messages, spotify, chrome,
# slack, vs code, iterm, system preferences

# ==================================================
# config, misc
# ==================================================

# put .bash_profile and .vimrc in home directory

# git, set global identity info
git config --global user.email "patrickricheal@gmail.com"
git config --global user.name "pricheal"

# download git completion bash script
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# install vs code plugins
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension felixfbecker.php-debug # follow instructions on extension page to install xdebug

# set iterm2 theme to tomorrow_night_80s.itermcolors

# mysql workbench sql editor preferences, disable safe updates

# web dev environment setup
