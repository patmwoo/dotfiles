# dotfiles

dotfiles and scripts for setting up development environments

## macos

#### Setup instructions

Clone repository to home directory, run mac.sh bootstrap script

```sh
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
zsh ~/dotfiles/mac.sh
```

#### Manual stuff

* Finder preferences, set default directory to home, remove unused items from sidebar
* General preferences, set appearance (light/dark) to auto
* Dock preferences, enable auto hide/show, enable minimize window into app icon, disable show recent applications
* Trackpad preferences, set tracking speed to third to last tick, disable *force click and haptic feedback*, disable swipe between pages (under gestures)
* Keyboard preferences, set both *key repeat* and *delay until repeat* to second to last tick, rebind caps lock to ctrl in modifier keys, disable add period with double space
* Mission control preferences, disable auto rearrange of spaces
* Notification settings, disable *show notification preview* for messages
* Enable battery percentage from battery icon on menu bar
* Manually remove downloads folder from dock
* Install 1password x for chrome, logic pro, pages, numbers, and keynote
* Put *installed* apps on second page of launch pad
* Set dock apps to finder, calendar, notes, reminders, photos, messages, spotify, chrome, slack, vs code, iterm, system preferences
* Set font in iterm to roboto mono

## ubuntu server

Add user, clone repository to home directory, run ubuntu.sh bootstrap script

```sh
adduser pat
usermod -aG sudo pat
mkdir /home/pat/.ssh
cp /root/.ssh/authorized_keys /home/pat/.ssh/authorized_keys # todo: specific for digital ocean, make generic system for managing ssh keys
chown -R pat:pat /home/pat/.ssh
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
bash ~/dotfiles/ubuntu.sh
```
