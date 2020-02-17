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

" enable line numbers
set number

" enable ruler
set ruler

" enable syntax highlighting
syntax on

" base16 vim
if filereadable(expand("~/.vimrc_background"))
  set termguicolors
  let base16colorspace=256
  source ~/.vimrc_background
endif

" set line number background to normal background color
execute 'highlight LineNr guibg=#' . g:base16_gui00
