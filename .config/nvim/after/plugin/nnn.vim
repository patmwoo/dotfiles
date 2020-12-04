" .config/nvim/nnn.vim, config for nnn.vim
" source: https://github.com/pricheal/dotfiles

if exists('g:nnn#loaded')

    " make nnn use earlier colorscheme (uses default terminal colors)
    let g:nnn#command = 'nnn -C'
    
    " remap keybind to start nnn in current file's directory
    let g:nnn#set_default_mappings = 0
    nnoremap <leader>n :NnnPicker %:p:h<CR>
    
    " make nnn appear in a floating window
    let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

endif
