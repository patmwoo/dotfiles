# mac.sh, sets up my macOS environment
# author: Patrick Richeal
# last modified: 5/8/2018
# source: https://github.com/pricheal/dotfiles
#
# Step 1, ensure macOS has all updates installed
# Step 2, clone the dotfiles repo to any location
# Step 3, run this script from the root of the dotfiles repo
# Step 4, restart computer
# Step 5, manually do the following if applicable
#     - Set mouse/trackpad tracking speed
#     - Enable dark mode (System preferences, general)
#     - Put installed apps onto second page of Launchpad
#     - Remove unused apps from dock and add installed apps (order is Finder, Calendar, Notes, Reminders, Photos, Messages, Dashlane, Google Chrome, Sublime Text, iTerm, System Preferences)
#     - Remove unnecessary items from Finder sidebar (in Preferences of Finder)
#     - Add Google account under internet accounts
#     - Install Microsoft Office from Microsoft account
#     - Install ClearPass OnGuard

# ==================================================
# homebrew, package managers
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package managers
brew install node
brew install homebrew/php/composer
npm install -g bower

# install homebrew cask
brew tap caskroom/cask

# ==================================================
# apps
# ==================================================

# install macOS apps
brew cask install google-chrome
brew cask install discord
brew cask install dashlane
brew cask install filezilla
brew cask install postman
brew cask install mysqlworkbench
brew cask install iterm2
brew cask install google-backup-and-sync
brew cask install caskroom/drivers/logitech-options

# install homebrew mas (mac app store)
brew install mas

# install macOS app store apps
mas install 634148309 # logic pro 10.4.1
mas install 497799835 # xcode 9.2

# update installed macOS app store apps
mas upgrade

# =================================================
# fonts
# =================================================

brew cask install font-source-code-pro

# =================================================
# sublime text
# =================================================

# install from brew cask
brew cask install sublime-text

# create directory for sublime files incase they don't already exist
mkdir -p ~/Library/'Application Support'/'Sublime Text 3'/'Installed Packages'
mkdir -p ~/Library/'Application Support'/'Sublime Text 3'/Packages/User
mkdir -p ~/Library/'Application Support'/'Sublime Text 3'/Packages/Themes

# install package control
curl -o ~/Library/'Application Support'/'Sublime Text 3'/'Installed Packages'/'Package Control.sublime-package' https://packagecontrol.io/Package%20Control.sublime-package

# move list of installed sublime packages to correct place
cp 'Package Control.sublime-settings' ~/Library/'Application Support'/'Sublime Text 3'/Packages/User/'Package Control.sublime-settings'

# move sublime settings file to correct place
cp Preferences.sublime-settings ~/Library/'Application Support'/'Sublime Text 3'/Packages/User/Preferences.sublime-settings

# move sublime theme file to correct place
cp base16_eighties_italics.tmTheme ~/Library/'Application Support'/'Sublime Text 3'/Packages/Themes/base16_eighties_italics.tmTheme

# ==================================================
# git
# ==================================================

# set global identity info
git config --global user.email "patrickricheal@gmail.com"
git config --global user.name "Patrick Richeal"

# ==================================================
# system settings
# ==================================================

# change computer name
sudo scutil --set ComputerName pats-macbook

# get account name
currentUser=`ls -l /dev/console | cut -d " " -f4`

# enable battery percentage
sudo -u $currentUser defaults write com.apple.menuextra.battery ShowPercent YES
sudo -u $currentUser killall SystemUIServer

# set default directory for new finder window to home directory
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/$currentUser/"

# make apps minimize into their icon on dock
defaults write com.apple.dock minimize-to-application -bool true

# auto show/hide the dock
defaults write com.apple.dock autohide -bool true

# ==================================================
# bash
# ==================================================

# run bash setup script
./bash.sh
