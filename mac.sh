# mac.sh, sets up my macOS environment
# author: Patrick Richeal
# last modified: 7/29/2018
# source: https://github.com/pricheal/dotfiles
#
# Make sure macOS is up to date before running this script. Below is a list of
# things to do manually if applicable.
#
#  * Change computer name to pats-macbook
#  * Enable battery percentage
#  * Set default directory for new Finder window to home directory
#  * Set dock to auto show/hide
#  * Set trackpad tracking speed (3rd to last tick)
#  * Make apps minimize into their icon on dock
#  * Enable dark mode
#  * Remove unused items from Finder sidebar
#  * Put installed apps onto secone page of Launchpad
#  * Remove unused apps from dock and add installed apps (order is Finder, Calendar,
#    Notes, Reminders, Photos, Messages, Dashlane, Google Chrome, iTerm, System Preferences)
#  * Disable 'add period with double space'
#  * Install Microsoft Office from Microsoft account
#  * Install ClearPass OnGuard

# ==================================================
# homebrew, package managers
# ==================================================

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package managers
brew install node
brew install homebrew/php/composer
npm install -g bower

# install tools
brew install vim
brew install fzf
brew install the_silver_searcher

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
brew cask install mysqlworkbench
brew cask install iterm2
brew cask install google-backup-and-sync
brew cask install caskroom/drivers/logitech-options
brew cash install insomnia

# install homebrew mas (mac app store)
brew install mas

# install macOS app store apps
mas install 634148309 # logic pro 10.4.1
mas install 497799835 # xcode 9.2

# update installed macOS app store apps
mas upgrade

# ==================================================
# bash
# ==================================================

# install base16 shell themes
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# ==================================================
# git
# ==================================================

# set global identity info
git config --global user.email "patrickricheal@gmail.com"
git config --global user.name "pricheal"
