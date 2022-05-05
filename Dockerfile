from archlinux:latest

# ==========================
# install packages
# ==========================

run pacman -Syu --noconfirm

# system stuff
run pacman -S base-devel --noconfirm
run pacman -S git --noconfirm
run pacman -S tar --noconfirm
run pacman -S zip --noconfirm
run pacman -S unzip --noconfirm
run pacman -S gzip --noconfirm
run pacman -S diffutils --noconfirm
run pacman -S curl --noconfirm

# dev tools
run pacman -S neovim --noconfirm
run pacman -S tmux --noconfirm
run pacman -S nnn --noconfirm
run pacman -S fzf --noconfirm
run pacman -S ripgrep --noconfirm
run pacman -S jq --noconfirm
run pacman -S httpie --noconfirm

# languages + package managers
run pacman -S typescript --noconfirm
run pacman -S php --noconfirm
run pacman -S composer --noconfirm
run pacman -S python --noconfirm
run pacman -S python-pip --noconfirm

# misc
run pacman -S htop --noconfirm
run pacman -S sudo --noconfirm
run pacman -S keychain --noconfirm
run pacman -S trash-cli --noconfirm
run pacman -S openssh --noconfirm
run pacman -S dnsutils --noconfirm
run pacman -S man-db --noconfirm
run pacman -S w3m --noconfirm
run pacman -S bash-completion --noconfirm
run pacman -S github-cli --noconfirm
run pacman -S redis --noconfirm

# optional
run pacman -S neofetch --noconfirm
run pacman -S hey --noconfirm
run pacman -S asciinema --noconfirm

# ==========================
# user
# ==========================

run useradd -m pat
run passwd -d pat
run echo "pat ALL=(ALL) ALL" >> /etc/sudoers
user pat
workdir /home/pat

# ==========================
# node/npm
# ==========================

run curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

run source ~/.nvm/nvm.sh && nvm install 16 && nvm alias default 16

# language servers
run source ~/.nvm/nvm.sh && npm install -g typescript-language-server \
    intelephense @tailwindcss/language-server bash-language-server \
    vscode-langservers-extracted pyright @angular/language-server

# ==========================
# rvm
# ==========================

# see https://wiki.archlinux.org/title/RVM

run gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB
run curl -sSL https://get.rvm.io | bash -s stable
run bash -l -c "rvm install 2.7 && rvm use 2.7 --default"

# ==========================
# yay
# ==========================

run git clone https://aur.archlinux.org/yay.git ~/yay
run (cd ~/yay&& makepkg -si --noconfirm)
run rm -rf ~/yay

# misc
run yay -S mysql --noconfirm
run yay -S yadm-git --noconfirm

# install 1password cli
run gpg --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
run yay -S 1password-cli --noconfirm

# install http-prompt manually, aur package broken
run git clone https://aur.archlinux.org/http-prompt.git
run sed -i 's/3.9/3.10/g' http-prompt/PKGBUILD
run yay -S python-prompt_toolkit1 python-parsimonious --noconfirm
run cd http-prompt && makepkg -si --noconfirm
run rm -rf http-prompt

# optional
run yay -S ngrok --noconfirm
run yay -S mosh-git --noconfirm
run yay -S aws-cli-v2-bin --noconfirm
run yay -S grip --noconfirm

# ==========================
# docker
# ==========================

# install docker
run sudo pacman -S docker docker-compose --noconfirm
#todo: get docker working somehow
#run sudo systemctl enable --now docker.service
run sudo gpasswd -a pat docker

# install docker sync (for fitdegree)
run bash -l -c "gem install docker-sync"

# ==========================
# dotfiles
# ==========================

# install refreshkeys
run pip install git+https://github.com/pricheal/refreshkeys.git

# clone dotfiles
run echo 'woops'
run yadm clone --no-bootstrap https://github.com/pricheal/dotfiles.git
run yadm checkout $HOME

