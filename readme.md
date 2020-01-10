# dotfiles

dotfiles and scripts for setting up development environments

## macos

#### Setup instructions

Clone repository to home directory, run mac.sh bootstrap script

```sh
# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
zsh ~/dotfiles/mac.sh
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
* iTerm, set font to roboto mono under preferences -> profiles -> text, enable *applications in terminal may access clipboard* under preferences -> general -> selection

## ubuntu server

Add user, clone repository to home directory, run ubuntu.sh bootstrap script

```sh
# make pat user
adduser pat
usermod -aG sudo pat

# for digital ocean, copy authorized_keys from root user so pat can login
mkdir /home/pat/.ssh
cp /root/.ssh/authorized_keys /home/pat/.ssh/authorized_keys # todo: specific for digital ocean, make generic system for managing ssh keys
chown -R pat:pat /home/pat/.ssh

# -> login as pat

# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
bash ~/dotfiles/ubuntu.sh
```

## dev to do

In the pursuit of command line only development

* create system to pull ssh keys from 1password into new environments (remove todo from readme file)
* add roboto mono font install to mac.sh script
* look into zsh parameter auto complete (and for git / docker)
* figure out esc remap for macos
* get git status in left prompt (put the vi mode in there too)
* figure out gpg keys for git
* vim plugin manager
* vim base 16
* vim fugitive
* understand everything about vim sensible
* figure out a vim file manager
* fzf
* usql
* httpie, http-prompt, jq
