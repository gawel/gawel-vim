
augroup python
    au BufNewFile *.py,*.py_tmpl    read $HOME/.vim/bundle/gawel-vim/models/python.py
    au BufNewFile *.?py   read $HOME/.vim/bundle/gawel-vim/models/script.cpy
    au BufNewFile browser.py :read $HOME/.vim/bundle/gawel-vim/models/browser.py
    au BufNewFile interface*.py :read $HOME/.vim/bundle/gawel-vim/models/interfaces.py
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl setf python
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl :silent call FuToUtf8()
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl :set fileformat=unix
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl :silent call PyFile()
    au BufWinEnter *.?py,*.py,*.py_tmpl :let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
    au BufWinEnter *.?py,*.py,*.py_tmpl :let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
augroup END

" mapping for py
function! PyFile()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal number
    setlocal spelllang=en
    setlocal spell
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    vmap <buffer> ,c :call PythonCommentSelection()<CR>
    vmap <buffer> ,u :call PythonUncommentSelection()<CR>
    nmap <buffer> ,t :!python %<cr>
    nmap <buffer> ffb <Esc>:read $HOME/.vim/bundle/gawel-vim/models/browser.py<CR>/FIXME<CR>:1<CR>/<CR>
    imap <buffer> def<Space> def (self):<Esc>o"""<Esc>o"""<Esc><Up><Up><End><S-B>i
    imap <buffer> xxx import pdb;pdb.set_trace()
endfunction

" zope function

command! -nargs=0 CleanPython :call CleanPythonCode()
function! CleanPythonCode()
    :let pos = getpos('.')
    :try | :1s/^s*\n// | catch | endtry
    :try | :%s/\s\+$// | catch | endtry
    :try | :%s/'''/"""/g | catch | endtry
    :try | :%s/\s*,\s*\(\w\)/, \1/g | catch | endtry
    :try | :%s/,\s)/,)/g | catch | endtry
    :try | :%s/^\(\s*\n\)\{2,}/\r/ | catch | endtry
    :try | :%s/^class\s*/\rclass / | catch | endtry
    :try | :%s/\(\(def\|class\)\s.*:\n\s\+"""\)\s*\n\s\+/\1/ | catch | endtry
    :nohlsearch
    :call setpos('.', pos)
endfunction

