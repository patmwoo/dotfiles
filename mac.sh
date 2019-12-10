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
# homebrew, dev tools, apps
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package managers
brew install node
brew install composer

# install dev tools
brew install git
brew install vim
brew install fzf

# install languages
brew install python # python3
brew install python@2

# install casks
brew cask install google-chrome
brew cask install spotify
brew cask install slack
brew cask install visual-studio-code
brew cash install insomnia
brew cask install datagrip
brew cask install cyberduck
brew cask install google-backup-and-sync
brew cask install discord

# manual installs: 1password x for chrome, logic pro, microsoft office (from microsoft account,
# need to manually uninstall onenote and onedrive afterwards)

# put installed apps on second page of launch pad

# set dock apps to finder, calendar, notes, reminders, photos, messages, spotify, chrome,
# slack, vs code, terminal, system preferences

# ==================================================
# config, misc
# ==================================================

# download .zshrc, .vimrc, and .tmux.conf
curl -o ~/.zshrc https://raw.githubusercontent.com/pricheal/dotfiles/master/.zshrc && source ~/.zshrc
curl -o ~/.vimrc https://raw.githubusercontent.com/pricheal/dotfiles/master/.vimrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/pricheal/dotfiles/master/.tmux.conf

# set shell theme
base16_eighties

# git, set global identity info
git config --global user.email "patrickricheal@gmail.com"
git config --global user.name "pricheal"

# follow web dev environment setup in https://gist.github.com/pricheal/ee9ad55da3c3ae1e92970fbd2cd96f63
