" .vim/plugin/gitgutter.vim, config for gitgutter
" source: https://github.com/pricheal/dotfiles

" map hunk navigation to 'h' instead of 'c'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" set sign column background to line number background
highlight! link SignColumn LineNr

" make sign background match sign column background
let g:gitgutter_set_sign_backgrounds = 1
