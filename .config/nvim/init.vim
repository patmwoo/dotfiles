" .config/nvim/init.vim, neovim config
" source: https://github.com/pricheal/dotfiles

" ----- misc ----- "

set nowrap " set nowrap by default
set hidden " allow unsaved buffers to be put in the background
set number " enable line numbers
set mouse=a " enable mouse
set nofixendofline " disable fix end of line thing
set diffopt+=vertical " set diff to default vertical

" unbind space default action, change leader to space
nnoremap <Space> <NOP>
let mapleader = " "

" make it easy to move through wrapped lines
noremap j gj
noremap k gk

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" ----- plugs ----- "

" install vim plug if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'chriskempson/base16-vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

" source lua lsp config file
lua require("lsp")

