# mac.sh, sets up my ideal macos environment
# source: https://github.com/pricheal/dotfiles

# ==================================================
# os config
# ==================================================

# make sure macos is up to date

# finder preferences
#   - set default directory to home
#   - remove unused items from finder sidebar

# general preferences
#   - set appearance to auto

# dock preferences
#   - enable auto hide/show dock
#   - enable minimize windows into app icon
#   - disable show recent applications

# trackpad preferences
#   - set tracking speed to third to last tick
#   - disable force click and haptic feedback
#   - under gestures, disable swipe between pages

# keybord preferences
#   - set both key repeat and delay until repeat to second to last tick
#   - rebind caps lock to ctrl in modifier keys
#   - disable add period with double space

# mission control preferences
#   - disable auto rearrange of spaces

# notification settings
#   - turn off show notification preview for messages
#   - turn off all notification settings for cyberduck

# misc
#   - enable battery percentage from battery icon on menu bar
#   - manually remove downloads from dock

# ==================================================
# installs
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install dev tools
brew install tmux
brew install git
brew install vim
brew install fzf
brew install less
brew tap xo/xo && brew install usql

# install languages
brew install python

# install package managers
brew install node
brew install composer

# install cli stuff
brew install rigellute/tap/spotify-tui
brew install neofetch

# install gui apps
brew cask install google-chrome
brew cask install spotify
brew cask install iterm2
brew cask install slack
brew cask install visual-studio-code
brew cash install insomnia
brew cask install datagrip
brew cask install cyberduck
brew cask install discord

# manual installs: 1password x for chrome, logic pro, pages, numbers, keynote

# put installed apps on second page of launch pad

# set dock apps to finder, mail, calendar, notes, reminders, photos, messages, spotify, chrome,
# slack, vs code, iterm, system preferences

# ==================================================
# config
# ==================================================

# symlink files to home folder
ln -s ~/dotfiles/.zshrc ~/.zshrc && source ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf .tmux.conf

# generate key bindings for less
lesskey ~/dotfiles/.lesskey

# set shell theme
base16_eighties

# git, set global identity info
git config --global user.email "patrickricheal@gmail.com"
git config --global user.name "pricheal"

# follow web dev environment setup in https://gist.github.com/pricheal/ee9ad55da3c3ae1e92970fbd2cd96f63
