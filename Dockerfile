FROM ubuntu:latest

# necessary for man pages
RUN yes | unminimize

# fixes some rando issue that would appear every time bash
# started: "manpath: can't set the locale"
RUN apt-get install locales
RUN locale-gen en_US.UTF-8

# ========================
# installs
# ========================

RUN apt-get update

# install dev tools
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git zip unzip curl tmux fzf ripgrep \
    jq httpie mysql-client htop sudo trash-cli ssh dnsutils w3m man-db bash-completion \
    redis neofetch

# install neovim
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb && \
    dpkg -i nvim-linux64.deb && rm nvim-linux64.deb

# install github cli
RUN curl -LO https://github.com/cli/cli/releases/download/v2.9.0/gh_2.9.0_linux_amd64.deb && \
    dpkg -i gh_2.9.0_linux_amd64.deb && rm gh_2.9.0_linux_amd64.deb

# install languages + package managers
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php composer
RUN apt-get install -y python3 python3-pip

# install 1password cli
RUN mkdir op && cd op && \
    curl -LO https://cache.agilebits.com/dist/1P/op2/pkg/v2.2.0/op_linux_amd64_v2.2.0.zip && \
    unzip op_linux_amd64_v2.2.0.zip && mv op /usr/bin/op && cd .. && rm -rf op

# install http-prompt
RUN pip install -U pygments
RUN pip install http-prompt

# install ngrok
RUN curl -LO https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin && \
    rm ngrok-v3-stable-linux-amd64.tgz

# install yadm
RUN curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && \
    chmod a+x /usr/local/bin/yadm

# install nnn
RUN curl -LO https://github.com/jarun/nnn/releases/download/v4.5/nnn-static-4.5.x86_64.tar.gz && \
    tar xf nnn-static-4.5.x86_64.tar.gz && mv nnn-static /usr/local/bin/nnn && \
    rm nnn-static-4.5.x86_64.tar.gz

# install sops
RUN curl -LO https://github.com/mozilla/sops/releases/download/v3.7.3/sops_3.7.3_amd64.deb && \
    dpkg -i sops_3.7.3_amd64.deb && rm sops_3.7.3_amd64.deb

# install delta
RUN curl -LO https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb && \
    dpkg -i git-delta_0.13.0_amd64.deb && rm git-delta_0.13.0_amd64.deb

# ========================
# user
# ========================

RUN useradd -m kat
RUN passwd -d kat
RUN echo "kat ALL=(ALL) ALL" >> /etc/sudoers
RUN usermod -s /bin/bash kat
USER kat
WORKDIR /home/kat

# needed for github codespaces ssh capability
RUN sudo groupadd ssh

# ==========================
# node/npm
# ==========================

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN bash -c "source ~/.nvm/nvm.sh && nvm install 16 && nvm alias default 16"

# language servers
RUN bash -c "source ~/.nvm/nvm.sh && npm install -g typescript-language-server \
    intelephense @tailwindcss/language-server bash-language-server \
    vscode-langservers-extracted pyright @angular/language-server"

# ==========================
# rvm
# ==========================

RUN gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN bash -l -c "rvm install 3.1.2 && rvm use 3.1.2 --default"

# docker sync
RUN bash -l -c "gem install docker-sync"

# ==========================
# dotfiles
# ==========================

# install refreshkeys
RUN sudo apt-get install -y keychain pinentry-tty
RUN pip install git+https://github.com/katmfoo/refreshkeys.git

# clone dotfiles
RUN yadm clone --no-bootstrap https://github.com/katmfoo/dotfiles.git
RUN yadm checkout $HOME

