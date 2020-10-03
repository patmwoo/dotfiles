" .vim/autoload/yank.vim, yank in vim
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

" use above function whenever text is yanked in vim
function! CopyYank() abort
  call Yank(join(v:event.regcontents, "\n"))
endfunction
autocmd TextYankPost * call CopyYank()
