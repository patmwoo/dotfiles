" .vimrc, configs vim
" source: https://github.com/pricheal/dotfiles

" make backspace work nicely in insert mode
set backspace=indent,eol,start

" enable line numbers
set number

" enable ruler
set ruler

" enable syntax highlighting
syntax on

" install vim plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
call plug#end()
