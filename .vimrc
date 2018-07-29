" .vimrc, configs vim
" author: Patrick Richeal
" last modified: 7/28/2018
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

" make backspace work like most other programs
set backspace=2

" necessary for lightline
set laststatus=2
set noshowmode

" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" set fzf to utilize .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" make fzf use vim theme colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" lightline theme
let g:lightline = { 'colorscheme': 'jellybeans' }

" colorscheme
colorscheme jellybeans
