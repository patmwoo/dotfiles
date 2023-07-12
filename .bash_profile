# .bash_profile
# source: https://github.com/katmfoo/dotfiles

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# if interactive, source bashrc (needed to avoid keychain making desktop
# environment hang up on login)
if [[ $- == *i* ]]; then
    [[ -f ~/.bashrc ]] && . ~/.bashrc
fi

