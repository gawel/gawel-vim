command! -nargs=0 TrailingSpaces :%s/\s\+$//
highlight SpellBad ctermbg=darkyellow guibg=darkyellow
highlight SpellCap ctermbg=darkyellow guibg=darkyellow
highlight SpellLocal ctermbg=darkyellow guibg=darkyellow
highlight SpellRare ctermbg=darkyellow guibg=darkyellow

imap <C-X> <C-X>s

augroup dtml
    au BufEnter *.css.dtml  setfiletype css
    au BufEnter *.js.dtml setfiletype javascript
augroup END

augroup filetypedetect
  au! BufRead,BufNewFile *.gtd	set filetype=gtd
augroup END

augroup make
  au! BufRead,BufNewFile,BufEnter Makefile setlocal noexpandtab
augroup END

