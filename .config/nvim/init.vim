" .config/nvim/init.vim, neovim config
" source: https://github.com/katmfoo/dotfiles

let mapleader=" "
set nowrap " set nowrap by default
set number " enable line numbers
set mouse=a " enable mouse

" make it easy to move through wrapped lines
noremap j gj
noremap k gk

" fix random end of file new line thing
set noeol
set binary

" system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" stuff for vs code
if exists('g:vscode')

    nnoremap ga <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
    nnoremap gH <Cmd>call VSCodeNotify('references-view.findReferences')<CR>

    nnoremap gu <Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>

    nnoremap ]c <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
    nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
    nnoremap ]<Space> <Cmd>call VSCodeNotify('editor.action.insertLineAfter')<CR>
    nnoremap [<Space> <Cmd>call VSCodeNotify('editor.action.insertLineBefore')<CR>

endif

