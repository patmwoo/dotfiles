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
  * Set color scheme ([afterglow](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Afterglow.itermcolors))
  * Set font to roboto mono, font size to 14, n/n to 108
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

* Set color scheme (afterglow)
* Add ubuntu mono font
* Set caps lock to ctrl
* Add private ssh key (copy to clipboard from 1password app)
* Turn on alternate app icon

## misc notes

* issues with mosh
  * doesn't have built in scroll back buffer, need to use tmux ([see issue](https://github.com/mobile-shell/mosh/issues/2))
  * screen doesn't restore after exitting full screen apps (e.g. vim), but fixed when using tmux ([see issue](https://github.com/mobile-shell/mosh/issues/109))
* issues with blink shell
  * doesn't support setting colors from escape sequences (so no base16 shell) ([see issue](https://github.com/blinksh/blink/issues/540))

## dev to do

In the pursuit of command line only development

* add font install for fantasque-sans-mono
* look into gnu stow
* figure out gpg keys for git
* set tmux status bar to top
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
