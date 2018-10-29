augroup go
    au BufNewFile,BufRead *.go   setf go
augroup END

augroup less
    au BufNewFile,BufRead *.less   setf less
augroup END

augroup yaml
    au BufNewFile *.yml    read $HOME/.vim/bundle/gawel-vim/models/template.yml
    au BufNewFile,BufRead *.yml   :silent call AutoJinja()
augroup END

augroup python
    au BufNewFile *.py,*.py_tmpl    read $HOME/.vim/bundle/gawel-vim/models/python.py
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl setf python
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl syn keyword pythonStatement async
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl syn keyword pythonStatement await
    au BufNewFile,BufRead *.?py,*.py_tmpl vmap <buffer> <C-i> :s/\%V\(.*\)\%V/_('\1')/<CR>
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl vmap <buffer> ,c :call PythonCommentSelection()<CR>
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl vmap <buffer> ,u :call PythonUncommentSelection()<CR>
augroup END

augroup html
    au BufNewFile *[^w].html,*[^w].tpl,*.mako  read $HOME/.vim/bundle/gawel-vim/models/template.html
    au BufNewFile,BufRead *.tpl,*.mako   setf html
    au BufNewFile,BufRead *[^w].html,*.tpl,*.mako   :set fileformat=unix
    au BufNewFile,BufRead *[^w].html,*.tpl,*.mako   :silent call AutoHTML()
    au BufNewFile,BufRead *.html   :silent call AutoJinja()
augroup END


function! AutoHTML()
    setlocal filetype=html
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal spelllang=en
    setlocal spell
    vmap <buffer> <C-i> :s/\%V\(.*\)\%V/${_('\1')}/<CR>
endfunction

function! AutoJinja()
    imap <buffer> bbb {%  %}<Esc>2<Left>i
    imap <buffer> vvv {{  }}<Esc>2<Left>i
    imap <buffer> iii {% if  %}{% endif %}<Esc>13<Left>i
    imap <buffer> rrr {% for  %}{% endfor %}<Esc>14<Left>i
endfunction
