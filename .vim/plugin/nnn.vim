" .vim/plugin/nnn.vim, config for nnn.vim
" source: https://github.com/pricheal/dotfiles

" make nnn use earlier colorscheme (uses default terminal colors)
let g:nnn#command = 'nnn -C'

" hide weird green status line
let g:nnn#statusline = 0

" remap keybind to start nnn in current file's directory
let g:nnn#set_default_mappings = 0
nnoremap <leader>n :NnnPicker '%:p:h'<CR>

" floating window
"let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
