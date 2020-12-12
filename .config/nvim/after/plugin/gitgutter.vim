" .config/nvim/after/plugin/gitgutter.vim, config for vim-gitgutter
" source: https://github.com/pricheal/dotfiles

if exists("g:loaded_gitgutter")

    " disable signs and enable line number highlights
    set scl=no
    GitGutterLineNrHighlightsEnable

endif
