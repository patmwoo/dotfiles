from ubuntu:latest

# necessary for man pages
run yes | unminimize

# ========================
# installs
# ========================

run apt-get update

# install dev tools
run DEBIAN_FRONTEND=noninteractive apt-get install -y git zip unzip curl tmux fzf ripgrep \
    jq httpie mysql-client htop sudo trash-cli ssh dnsutils w3m man-db bash-completion \
    redis neofetch

# install neovim
run curl -LO https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb && \
    dpkg -i nvim-linux64.deb && rm nvim-linux64.deb

# install github cli
run curl -LO https://github.com/cli/cli/releases/download/v2.9.0/gh_2.9.0_linux_amd64.deb && \
    dpkg -i gh_2.9.0_linux_amd64.deb && rm gh_2.9.0_linux_amd64.deb

# install languages + package managers
run DEBIAN_FRONTEND=noninteractive apt-get install -y php composer
run apt-get install -y python3 python3-pip

# install 1password cli
run mkdir op && cd op && \
    curl -LO https://cache.agilebits.com/dist/1P/op2/pkg/v2.2.0/op_linux_amd64_v2.2.0.zip && \
    unzip op_linux_amd64_v2.2.0.zip && mv op /usr/bin/op && cd .. && rm -rf op

# install http-prompt
run pip install -U pygments
run pip install http-prompt

# install ngrok
run curl -LO https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin && \
    rm ngrok-v3-stable-linux-amd64.tgz

# install yadm
run curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && \
    chmod a+x /usr/local/bin/yadm

# install nnn
run curl -LO https://github.com/jarun/nnn/releases/download/v4.5/nnn-static-4.5.x86_64.tar.gz && \
    tar xf nnn-static-4.5.x86_64.tar.gz && mv nnn-static /usr/local/bin/nnn && \
    rm nnn-static-4.5.x86_64.tar.gz

# ========================
# user
# ========================

run useradd -m pat
run passwd -d pat
run echo "pat ALL=(ALL) ALL" >> /etc/sudoers
user pat
workdir /home/pat

# ==========================
# node/npm
# ==========================

run curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

run bash -c "source ~/.nvm/nvm.sh && nvm install 16 && nvm alias default 16"

# language servers
run bash -c "source ~/.nvm/nvm.sh && npm install -g typescript-language-server \
    intelephense @tailwindcss/language-server bash-language-server \
    vscode-langservers-extracted pyright @angular/language-server"

# ==========================
# rvm
# ==========================

run gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB
run curl -sSL https://get.rvm.io | bash -s stable
run bash -l -c "rvm install 2.7 && rvm use 2.7 --default"

# ==========================
# dotfiles
# ==========================

# install refreshkeys
run sudo apt-get install -y keychain pinentry-tty
run pip install git+https://github.com/pricheal/refreshkeys.git

# clone dotfiles
run echo 'hi'
run yadm clone --no-bootstrap https://github.com/pricheal/dotfiles.git
run yadm checkout $HOME

