command! -nargs=0 -range Paste :call Paste()
function! Paste()
    let tmpfile = tempname()
    silent exe "'<,'>write! ".tmpfile
    echo system("fp ".tmpfile)
    silent echo system("rm ".tmpfile)
endfunction
