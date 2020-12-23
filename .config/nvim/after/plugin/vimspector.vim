" .config/nvim/after/plugin/vimspector.vim, vimspector config
" source: https://github.com/pricheal/dotfiles

" vimspector mappings
nmap <leader>xx <Plug>VimspectorRestart
nmap <leader>xq :call vimspector#Reset()<cr>
nmap <leader>xc <Plug>VimspectorContinue
nmap <leader>xs <Plug>VimspectorStop
nmap <leader>xb <Plug>VimspectorToggleBreakpoint
nmap <leader>xi <Plug>VimspectorStepInto
nmap <leader>xo <Plug>VimspectorStepOver
nmap <leader>xr <Plug>VimspectorStepOut

" enable sign column in code window when vimspector opens
function! s:customiseUI()
  call win_gotoid(g:vimspector_session_windows.code)
  set signcolumn=yes
endfunction
autocmd User VimspectorUICreated call s:customiseUI()

" set vimspector signs
sign define vimspectorBP text=* texthl=LineNr
sign define vimspectorBPCond text=*? texthl=LineNr
sign define vimspectorBPDisabled text=* texthl=LineNr
sign define vimspectorPC text=\ > texthl=LineNr
sign define vimspectorPCBP text=*> texthl=LineNr

" make vimspector signs override git gutter signs
let g:vimspector_sign_priority = { 'vimspectorBP': 12, 'vimspectorBPCond': 11, 'vimspectorBPDisabled': 10 }

