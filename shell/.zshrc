# .zshrc, config for zsh
# source: https://github.com/pricheal/dotfiles

# ==============================
# generic shell stuff
# ==============================

source ~/dotfiles/shell/aliases.sh
source ~/dotfiles/shell/base16.sh

# ==============================
# fitdegree stuff
# ==============================

export PATH=$PATH:~/dev/fitdegree/scripts/bin

# ==============================
# zsh specific stuff
# ==============================

# prompt
PROMPT='%~ %# '

# enable extended globbing
setopt extendedglob

# command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# ==============
# vim mode stuff
# ==============

# enable vim mode
bindkey -v

# fix esc delay
export KEYTIMEOUT=1

# history up and down
bindkey '^p' up-history
bindkey '^n' down-history

# make backspace work after returning from normal mode
bindkey '^?' backward-delete-char

# add vim-like incremental search bindings
bindkey '^r' history-incremental-search-backward

# add ability to open current command in vim
autoload edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line

# add mode indicator
function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# must be -1 instead of 0 otherwise the cursor will be offset, -1 makes
# it so last line of terminal is unusable when right side prompt is
# being displayed (on macos atleast)
ZLE_RPROMPT_INDENT=-1
setopt PROMPT_SUBST
RPS1='${${KEYMAP/vicmd/[NORMAL]}/(main|viins)/}'
