" .vim/plugin/fzf.vim, config for fzf
" source: https://github.com/pricheal/dotfiles

" custom fzf ripgrep command, make it forward all flags to ripgrep, see issue: https://github.com/junegunn/fzf.vim/issues/838
command! -bang -nargs=* Rg call fzf#vim#grep("rg --color=always --vimgrep ".<q-args>, 1, <bang>0)

" add key binds
map <leader>f :GFiles<CR>
map <leader>g :GFiles?<CR>
map <leader>b :Buffers<CR>
