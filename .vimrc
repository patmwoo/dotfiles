" .vimrc, configs vim
" author: Patrick Richeal
" last modified: 7/19/2018
" source: https://github.com/pricheal/dotfiles

" enable line numbers
set number

" enable ruler
set ruler

" set tab to 2 spaces and enable softtabstop
set expandtab
set shiftwidth=2
set softtabstop=2

" enable changing buffers that have unwritten changes
set hidden

" make vim use system clipboard
set clipboard=unnamed

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" set fzf to utilize .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
