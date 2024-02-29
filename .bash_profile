# .bash_profile
# source: https://github.com/katmfoo/dotfiles

# set path, manpath, etc. for homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# if interactive, source bashrc
if [[ $- == *i* ]]; then
    [[ -f ~/.bashrc ]] && . ~/.bashrc
fi

