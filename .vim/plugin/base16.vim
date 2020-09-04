" .vim/plugin/base16.vim, config for base16-vim
" source: https://github.com/pricheal/dotfiles

" enable true color
set termguicolors

" set line number background to normal base16 background color
autocmd ColorScheme * execute 'highlight LineNr guibg=#' . g:base16_gui00

" copy theme from base16 shell
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

