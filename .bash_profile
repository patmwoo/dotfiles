# .bash_profile
# source: https://github.com/katmfoo/dotfiles

# set path, manpath, etc. for homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# if interactive, source bashrc
if [[ $- == *i* ]]; then
    [[ -f ~/.bashrc ]] && . ~/.bashrc
fi

cat << EOF
                      _  __ __
   ____ ___   ____ _ (_)/ // /_   ____   _  __
  / __  __ \ / __  // // // __ \ / __ \ | |/_/
 / / / / / // /_/ // // // /_/ // /_/ /_>  <
/_/ /_/ /_/ \__,_//_//_//_.___/ \____//_/|_|
EOF
