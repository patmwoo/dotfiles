" .config/nvim/init.vim, neovim config
" source: https://github.com/katmfoo/dotfiles

" ----- misc ----- "

set nowrap " set nowrap by default
set hidden " allow unsaved buffers to be put in the background
set number " enable line numbers
set mouse=a " enable mouse
set diffopt+=vertical " set diff to default vertical

" unbind space default action, change leader to space
nnoremap <Space> <NOP>
let mapleader = " "

" make it easy to move through wrapped lines
noremap j gj
noremap k gk

" fix random end of file new line thing
set noeol
set binary

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

