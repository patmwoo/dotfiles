" .config/nvim/after/plugin/fzf.vim, config for fzf.vim
" source: https://github.com/katmfoo/dotfiles

if exists('g:loaded_fzf')

    " custom fzf ripgrep command, make it forward all flags to ripgrep, see issue: https://github.com/junegunn/fzf.vim/issues/838
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --color=always --vimgrep ".<q-args>, 1, <bang>0)

    " add key binds
    map <leader>f :GFiles<CR>
    map <leader>v :GFiles?<CR>
    map <leader>b :Buffers<CR>

    " set popup border color
    let g:fzf_colors = { 'border':  ['fg', 'Comment'] }

    " disable preview window
    let g:fzf_preview_window = []

endif

