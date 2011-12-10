augroup rst
    au BufNewFile,BufRead *.txt,*.rst   setf rst
    au BufNewFile,BufRead *.txt,*.rst   call FuToUtf8()
    au BufNewFile,BufRead *.txt,*.rst   call AutoRST()
    au BufNewFile,BufRead *.txt setlocal spelllang=fr
    au BufNewFile,BufRead *.rst setlocal spelllang=fr
augroup END

augroup END

" mapping for rst
function! AutoRST()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal spell
    setlocal spelllang=fr
    imap <buffer> lll ` <>`_<Esc>bba
endfunction


