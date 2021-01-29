" Language:    Salty
" Maintainer:  Adit <bluemangroupie@gmail.com>
" Based On:    MoonScript by leafo <leafot@gmail.com>
" URL:         http://github.com/adit/salty-vim
" License:     WTFPL

autocmd BufNewFile,BufRead *.salt set filetype=salt

function! s:DetectSalt()
    if getline(1) =~ '^#!.*\<salt\>'
        set filetype=salt
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectSalt()
