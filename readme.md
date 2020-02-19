# dotfiles

minimalist dotfiles for macos and linux

## macos

Clone repository to home directory, run bootstrap.sh script

```sh
# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
~/dotfiles/bootstrap.sh
```

Do this stuff manually

* Finder preferences, set default directory to home, remove unused items from sidebar
* General preferences, set appearance (light/dark) to auto
* Dock preferences, enable auto hide/show, enable minimize window into app icon, disable show recent applications
* Mission control preferences, disable auto rearrange of spaces
* Notification settings, disable show notification preview for messages
* Keyboard preferences, set both key repeat and delay until repeat to second to last tick, rebind caps lock to ctrl in modifier keys, disable add period with double space
* Trackpad preferences, set tracking speed to third to last tick, disable force click and haptic feedback, disable swipe between pages (under gestures)
* Enable battery percentage from battery icon on menu bar
* Manually remove downloads folder from dock
* Install 1password x for chrome
* Put installed apps on second page of launch pad
* Set dock apps to finder, calendar, notes, reminders, photos, messages, spotify, chrome, slack, vs code, iterm, system preferences
* iTerm
  * Set font to fantasque sans mono size 14
  * Enable applications in terminal may access clipboard under preferences -> general -> selection

## ubuntu server

Add user, clone repository to home directory, run bootstrap.sh script

```sh
# make pat user
adduser pat
usermod -aG sudo pat

# put public ssh key in authorized_keys
mkdir -m 700 /home/pat/.ssh
curl https://raw.githubusercontent.com/pricheal/dotfiles/master/id_rsa.pub -o /home/pat/.ssh/authorized_keys
chmod 600 /home/pat/.ssh/authorized_keys
chown -R pat:pat /home/pat/.ssh

# -> login as pat

# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
tmux new -s bootstrap ~/dotfiles/bootstrap.sh
```

## blink shell

Do this stuff manually

* Set caps lock to ctrl
* Set font to fantasque sans mono size 14
* Add private ssh key (copy to clipboard from 1password app)
* Turn on alternate app icon

## dev to do

In the pursuit of command line only development

* build custom powerline font
* figure out gpg keys for git
* set tmux right status text to " 10:53a | Thu | 1/30/20 "
* make tmux window tags prettier
* vim fugitive
* understand everything about vim sensible
* figure out a vim file manager
* vim language server
* fzf
* httpie, http-prompt, jq
* grep
* vim debug for php
