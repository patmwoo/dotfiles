" .vim/plugin/lightline.vim, config for lightline
" source: https://github.com/pricheal/dotfiles

" misc config that works well for lightline
set laststatus=2
set noshowmode " make mode not appear in command line

" create lightline theme from base16 colors defined in base16-vim themes

" color definitions
let s:black = "#" . g:base16_gui00
let s:red = "#" . g:base16_gui08
let s:green = "#" . g:base16_gui0B
let s:yellow = "#" . g:base16_gui0A
let s:blue = "#" . g:base16_gui0D
let s:magenta = "#" . g:base16_gui0E
let s:cyan = "#" . g:base16_gui0C
let s:white = "#" . g:base16_gui05
let s:bright_black = "#".g:base16_gui03
let s:bright_white = "#" . g:base16_gui07
let s:color16 = "#" . g:base16_gui09
let s:color17 = "#" . g:base16_gui0F
let s:color18 = "#" . g:base16_gui01
let s:color19 = "#" . g:base16_gui02
let s:color20 = "#" . g:base16_gui04
let s:color21 = "#" . g:base16_gui06

" lightline color scheme
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:blue ], [ s:white, s:color18 ] ]
let s:p.normal.middle = [ [ s:white, s:color18 ] ]
let s:p.normal.right = [ [ s:white, s:color19 ], [ s:white, s:color19 ] ]
let s:p.insert.left = [ [ s:black, s:yellow ] ]
let s:p.replace.left = [ [ s:black, s:red ] ]
let s:p.visual.left = [ [ s:black, s:green ] ]
let s:p.tabline.tabsel = [ [ s:black, s:yellow ] ]
let s:p.tabline.left = [ [ s:white, s:color18 ] ]
let s:p.tabline.middle = [ [ s:white, s:color18 ] ]
let s:p.tabline.right = [ [ s:white, s:color18 ] ]
let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

" create lightline theme
let g:lightline#colorscheme#base16#palette = lightline#colorscheme#fill(s:p)

" set lightline theme
let g:lightline = {'colorscheme': 'base16'}
