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

" make true color work under vim (see
" https://github.com/tmux/tmux/issues/1246)
"if exists('+termguicolors')
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  "set termguicolors
"endif

" base16 vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
