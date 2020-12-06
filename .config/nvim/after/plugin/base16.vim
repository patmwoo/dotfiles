" .config/nvim/base16.vim, config for base16-vim
" source: https://github.com/pricheal/dotfiles

" enable true color
set termguicolors

try
    " this is here just to check if base16-vim is installed, so the
    " rest of the try catch block won't run (its a color scheme that
    " I don't like on purpose, is its the same colorscheme as whatever
    " gets set in .vimrc_background, the autocmd won't trigger)
    colorscheme base16-heetch

    " set line number background to normal base16 background color
    autocmd ColorScheme * execute 'highlight LineNr guibg=#' . g:base16_gui00

    " set color of lsp diagnostics
    autocmd ColorScheme * execute 'highlight LspDiagnosticsUnderlineError gui=underline guifg=#' . g:base16_gui08
    autocmd ColorScheme * execute 'highlight LspDiagnosticsUnderlineWarning gui=underline guifg=#' . g:base16_gui0A
    autocmd ColorScheme * execute 'highlight LspDiagnosticsUnderlineInformation gui=underline guifg=#' . g:base16_gui04
    autocmd ColorScheme * execute 'highlight LspDiagnosticsUnderlineHint gui=underline guifg=#' . g:base16_gui0D

    " set git gutter line number colors
    autocmd ColorScheme * execute 'highlight GitGutterAddLineNr guifg=#' . g:base16_gui0B
    autocmd ColorScheme * execute 'highlight GitGutterDeleteLineNr guifg=#' . g:base16_gui08
    autocmd ColorScheme * execute 'highlight GitGutterChangeLineNr guifg=#' . g:base16_gui0D
    autocmd ColorScheme * execute 'highlight GitGutterChangeDeleteLineNr guifg=#' . g:base16_gui0A

    " copy theme from base16 shell
    if filereadable(expand("~/.vimrc_background"))
        source ~/.vimrc_background
    else
        " default color scheme if there is no .vimrc_background
	colorscheme base16-default-dark
    endif

catch
endtry


