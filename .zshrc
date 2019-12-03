# .zshrc, config for zsh
# source: https://github.com/pricheal/dotfiles

# ==============
# aliases
# ==============

# general aliases
alias ls='ls -GF'

# quick nav aliases
alias dev='cd ~/dev/'
alias docroot='cd /usr/local/var/www'
alias fd='cd ~/dev/fitdegree'

# ==============
# misc
# ==============

# prompt
PROMPT='%~ %# '

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# ==============
# vim mode stuff
# ==============

# enable vim mode
bindkey -v

# fix esc delay
export KEYTIMEOUT=1

# add vim-like incremental search bindings
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# add ability to open current command in vim
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^V" edit-command-line

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
