augroup python
    au BufNewFile *.py,*.py_tmpl    read $HOME/.vim/bundle/gawel-vim/models/python.py
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl setf python
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl vmap <buffer> ,c :call PythonCommentSelection()<CR>
    au BufNewFile,BufRead *.?py,*.py,*.py_tmpl vmap <buffer> ,u :call PythonUncommentSelection()<CR>
augroup END

augroup zpt
    au BufNewFile *[^w].html,*[^w].?pt,*[^w].pt,*.mako  read $HOME/.vim/bundle/gawel-vim/models/template.pt
    au BufNewFile,BufRead *.?pt,*.pt,*.mako   setf html
    au BufNewFile,BufRead *[^w].html,*.?pt,*.pt,*.mako   :set fileformat=unix
    au BufNewFile,BufRead *[^w].html,*.?pt,*.pt,*.mako   :let xml_use_xhtml = 1
    au BufNewFile,BufRead *[^w].html,*.?pt,*.pt,*.mako   :source ~/.vim/ftplugin/xml.vim
    au BufNewFile,BufRead *[^w].html,*.?pt,*.pt,*.mako   :silent call AutoHTML()
    au BufNewFile,BufRead *.html   :silent call AutoDjango()
    au BufNewFile,BufRead *.?pt,*.pt   :silent call AutoPT()
augroup END

augroup zcml
    au BufNewFile *.zcml    read $HOME/.vim/bundle/gawel-vim/models/configure.zcml
    au BufNewFile,BufRead *.zcml   setf xml
    au BufNewFile,BufRead *.zcml imap <buffer> ppp <Esc>:read $HOME/.vim/bundle/gawel-vim/models/page.zcml<CR>
    au BufNewFile,BufRead *.zcml imap <buffer> vvv <Esc>:read $HOME/.vim/bundle/gawel-vim/models/view.zcml<CR>
    au BufNewFile,BufRead *.zcml imap <buffer> uuu <Esc>:read $HOME/.vim/bundle/gawel-vim/models/utility.zcml<CR>
augroup END

function! AutoHTML()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal spelllang=en
    setlocal spell
endfunction

function! AutoDjango()
    imap <buffer> ttt {% trans "" %}<Esc>3<Left>i
    imap <buffer> bbb {%  %}<Esc>2<Left>i
    imap <buffer> vvv {{  }}<Esc>2<Left>i
    imap <buffer> iii {% if  %}{% endif %}<Esc>13<Left>i
    imap <buffer> rrr {% for  %}{% endfor %}<Esc>14<Left>i
endfunction

function! AutoPT()
    syn match htmlTag "\(tal\|metal\):\([a-z]\)*"
    syn match htmlArg "\(tal\|metal\|i18n\):\([a-z]\|-\)*"
    syn match htmlArg "\([a-z]\)*-\([a-z]\)*="
    highlight Statement ctermfg=darkblue guifg=darkblue
    highlight Identifier ctermfg=darkblue guifg=darkblue
    imap <buffer> aaa tal:attributes=""<Esc>i
    imap <buffer> ccc tal:content=""<Esc>i
    imap <buffer> ddd tal:define=""<Esc>i
    imap <buffer> rrr tal:repeat=""<Esc>i
    imap <buffer> iii tal:condition=""<Esc>i
    imap <buffer> ttt i18n:translate=""<Esc>i
    imap <buffer> sss brains python:context.portal_catalog.searchResults(portal_type="
endfunction

augroup metadata
    au BufEnter *.metadata    setfiletype dosini
    au BufNewFile *.metadata  read $HOME/.vim/bundle/gawel-vim/models/metadata.metadata 
augroup END

augroup buildout
    au BufEnter buildout.cfg    setfiletype dosini
    au BufNewFile buildout.cfg  read $HOME/.vim/bundle/gawel-vim/models/buildout.cfg 
augroup END

augroup hgignore
    au BufNewFile .hgignore  read $HOME/.vim/bundle/gawel-vim/models/hgignore
augroup END

augroup hgrc
    au BufEnter .hgrc,hgrc    setfiletype dosini
    au BufNewFile .hgrc,hgrc  read $HOME/.vim/bundle/gawel-vim/models/hgrc
augroup END

