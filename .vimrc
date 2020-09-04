" .vimrc, configs vim
" source: https://github.com/pricheal/dotfiles

" ===================
" plugins
" ===================

" install vim plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sleuth'
Plug 'francoiscabrol/ranger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
call plug#end()

" coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-phpls',
\ 'coc-css', 'coc-angular', 'coc-json', 'coc-python', 'coc-sql',
\ 'coc-vimlsp']

" ===================
" essentials
" ===================

" make backspace work nicely in insert mode
set backspace=indent,eol,start

" disable line wrap
set nowrap

" default indentation (potentially overridden by vim-sleuth)
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

" stop vim from automatically adding a newline to end of file
set nofixendofline

" fix delay when exiting visual modes
set timeoutlen=1000 ttimeoutlen=0

" enable mouse
set mouse=a

" enable line numbers
set number

" enable sign column, make sign column just override the
" number column if not in a git repo (no git gutter)
let ouput = system('git rev-parse --is-inside-work-tree')
if v:shell_error == 0
  set signcolumn=yes
else
  set signcolumn=number
endif

" ===================
" misc
" ===================

set shortmess+=F " hide file name from command line on file open

" ===================
" key binds
" ===================

" make it easy to move through wrapped lines
noremap j gj
noremap k gk

" ===================
" commands
" ===================

command -nargs=? Tabsize call tab#Size(<f-args>)

