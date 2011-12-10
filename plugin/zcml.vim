augroup zcml
    au BufNewFile *.zcml    read $HOME/.vim/bundle/gawel-vim/models/configure.zcml
    au BufNewFile,BufRead *.zcml   setf xml
    au BufNewFile,BufRead *.zcml imap <buffer> ppp <Esc>:read $HOME/.vim/bundle/gawel-vim/models/page.zcml<CR>
    au BufNewFile,BufRead *.zcml imap <buffer> vvv <Esc>:read $HOME/.vim/bundle/gawel-vim/models/view.zcml<CR>
    au BufNewFile,BufRead *.zcml imap <buffer> uuu <Esc>:read $HOME/.vim/bundle/gawel-vim/models/utility.zcml<CR>
augroup END


