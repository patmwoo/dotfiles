" .vimrc, configs vim
" author: Patrick Richeal
" last modified: 7/29/2018
" source: https://github.com/pricheal/dotfiles

" ==============================
" general
" ==============================

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

" ==============================
" vim-plug and plugins
" ==============================

" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" list of plugins
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

" ==============================
" fzf
" ==============================

" set fzf default command to use silver searcher with utilize
" .gitignore flag
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

" ==============================
" lightline
" ==============================

" set statusbar to always show
set laststatus=2

" hide mode in status bar
set noshowmode


" lightline theme
let g:lightline = { 'colorscheme': 'jellybeans' }

" ==============================
" base16-vim
" ==============================

" set 256 color mode
let base16colorspace=256

" source the .vimrc_background file if it exists, so vim colorscheme
" matches the shell colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
