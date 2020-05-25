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
Plug 'chriskempson/base16-vim'
call plug#end()

" make backspace work nicely in insert mode
set backspace=indent,eol,start

" indentation stuff
set expandtab
set softtabstop=4
set shiftwidth=4

" stop vim from automatically adding a newline to end of file
set nofixendofline

" enable line numbers
set number

" enable ruler
set ruler

" enable syntax highlighting
syntax on

" set line number background to normal base16 background color
autocmd ColorScheme * execute 'highlight LineNr guibg=#' . g:base16_gui00

" color scheme
set termguicolors
colorscheme base16-tube
