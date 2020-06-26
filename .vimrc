" .vimrc, configs vim
" source: https://github.com/pricheal/dotfiles

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
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-sleuth'
call plug#end()

" coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-phpls',
\ 'coc-css', 'coc-angular', 'coc-json', 'coc-python', 'coc-sql',
\ 'coc-vimlsp']

" make backspace work nicely in insert mode
set backspace=indent,eol,start

" disable line wrap
set nowrap

" default indentation
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

" stop vim from automatically adding a newline to end of file
set nofixendofline

" enable mouse
set mouse=a

" enable line numbers
set number

" set line number background to normal base16 background color
autocmd ColorScheme * execute 'highlight LineNr guibg=#' . g:base16_gui00

" color scheme
set termguicolors
colorscheme base16-eighties
