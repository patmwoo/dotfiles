# dotfiles

minimalist dotfiles for macos and linux

## macos

#### Setup instructions

Clone repository to home directory, run bootstrap.sh script

```sh
# clone dotfiles and run bootstrap script
git clone https://github.com/pricheal/dotfiles.git ~/dotfiles
~/dotfiles/bootstrap.sh
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
* Install 1password x for chrome
* Put *installed* apps on second page of launch pad
* Set dock apps to finder, calendar, notes, reminders, photos, messages, spotify, chrome, slack, vs code, iterm, system preferences
* iTerm
  * Set font to roboto mono, font size to 14, n/n to 108 under preferences -> profiles -> text
  * Enable *applications in terminal may access clipboard* under preferences -> general -> selection

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

* Retrieve private key to ssh into remote servers, 1password app -> ssh private key -> view document -> copy private key to clip board -> blink app -> run `config` command -> keys -> plus -> import from clipboard
* Set caps lock to ctrl, blink app -> run `config` command -> keyboard -> caps lock -> as modifier, ctrl
* Add ubuntu mono font, blink app -> run `config` command -> appearance -> add a new font -> open gallery -> ubuntu mono.css -> view raw -> copy url -> paste into blink app -> import -> set name -> save -> select font -> open new terminal
* Turn on alternate app icon, -> blink app -> run `config` command -> appearance -> app icon -> turn on alternate

## misc notes

* issues with mosh
  * doesn't have built in scrool back buffer, need to use tmux ([see issue](https://github.com/mobile-shell/mosh/issues/2))
  * screen doesn't restore after exitting full screen apps (e.g. vim), but fixed is using tmux ([see issue](https://github.com/mobile-shell/mosh/issues/109))
* issues with blink shell
  * doesn't support setting colors from escape sequences (so no base16 shell) ([see issue](https://github.com/blinksh/blink/issues/540))

## dev to do

In the pursuit of command line only development

* get rid of base16 shell/vim
* setup terminal themes for iterm/blink
* find starter vim theme
* forward mailbox subdomain to digital ocean droplet, add host to ssh config
* look into bash auto complete (docker)
* make better prompt (user/host, git info)
* figure out gpg keys for git
* vim fugitive
* understand everything about vim sensible
* figure out a vim file manager
* fzf
* httpie, http-prompt, jq
