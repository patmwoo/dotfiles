# dotfiles

dotfiles and scripts for setting up development environments

## macos

#### Setup instructions

Clone repository to home directory, run mac.sh bootstrap script

```sh
# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
~/dotfiles/mac.sh
```

#### Manual stuff

* Finder preferences, set default directory to home, remove unused items from sidebar
* General preferences, set appearance (light/dark) to auto
* Dock preferences, enable auto hide/show, enable minimize window into app icon, disable show recent applications
* Mission control preferences, disable auto rearrange of spaces
* Notification settings, disable *show notification preview* for messages
* Keyboard preferences, set both *key repeat* and *delay until repeat* to second to last tick, rebind caps lock to ctrl in modifier keys, disable add period with double space
* Trackpad preferences, set tracking speed to third to last tick, disable *force click and haptic feedback*, disable swipe between pages (under gestures)
* Enable battery percentage from battery icon on menu bar
* Manually remove downloads folder from dock
* Install 1password x for chrome, logic pro, pages, numbers, and keynote
* Put *installed* apps on second page of launch pad
* Set dock apps to finder, calendar, notes, reminders, photos, messages, spotify, chrome, slack, vs code, iterm, system preferences
* iTerm
  * Set font to roboto mono, font size to 14, n/n to 108 under preferences -> profiles -> tex
  * Enable *applications in terminal may access clipboard* under preferences -> general -> selection

## ubuntu server

Add user, clone repository to home directory, run ubuntu.sh bootstrap script

```sh
# make pat user
adduser pat
usermod -aG sudo pat

# put public ssh key in authorized_keys
mkdir /home/pat/.ssh
curl https://raw.githubusercontent.com/pricheal/dotfiles/master/id_rsa.pub -o /home/pat/.ssh/authorized_keys
chown -R pat:pat /home/pat/.ssh

# -> login as pat

# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
tmux new -s bootstrap ~/dotfiles/ubuntu.sh
```

## dev to do

In the pursuit of command line only development

* switch back to bash
* create system to pull private ssh key from 1password into new environments
* create ssh config file
* look into bash auto complete (git & docker)
* make better prompt (user/host, git info, vi mode)
* figure out gpg keys for git
* vim plugin manager
* vim base 16
* vim fugitive
* understand everything about vim sensible
* figure out a vim file manager
* fzf
* httpie, http-prompt, jq
