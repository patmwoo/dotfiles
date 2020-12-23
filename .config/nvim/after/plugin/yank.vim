" .config/nvim/after/plugin/yank.vim, yank in vim
" source: https://sunaku.github.io/tmux-yank-osc52.html

" function to yank text using yank sh script
function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction

" map yank function to <leader>y
noremap <silent> <leader>y y:<C-U>call Yank(@0)<CR>
