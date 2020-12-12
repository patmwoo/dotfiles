" .config/nvim/after/plugin/sidescroll.vim, side scrolling key binds
" source: https://vi.stackexchange.com/a/26164

" make <c-l> turn on virtualedit and move half screen to the right
nnoremap <silent> <c-l> :set virtualedit=all<CR>zL

" make <c-r> move half screen to the left (and reset cursor to left most
" side of screen, that is my own addition)
nnoremap <silent> <c-h> zHg0

" turn virtualedit off once the cursor is back within the bounds of the line
augroup AllowHorizontalScroll
  autocmd!
  autocmd CursorMoved * if col('.') <= len(getline('.')) | set virtualedit= | endif
augroup END
