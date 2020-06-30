" .vim/autoload/tab.vim, tab functions
" source: https://github.com/pricheal/dotfiles

" set and get tab size in spaces
function tab#Size(...)
  if exists("a:1")
    let &tabstop=a:1
    let &softtabstop=a:1
    let &shiftwidth=a:1
    echo "Tab size set to " . a:1 . " spaces"
  else
    echo "Tab size is " . &softtabstop . " spaces"
  endif
endfunction

