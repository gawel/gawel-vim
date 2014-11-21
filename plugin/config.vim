set statusline=%F%m%r%h%w\ format=%{&ff}\ type=%Y\ x=%l\ y=%v\ %p%%\ %{strftime(\"%d/%m/%y\ -\%H:%M\")}
set grepprg=grep\ -R\ --exclude=\"*.pyc\"\ $*\ *\ /dev/null
let g:explDetailedHelp=0
let g:netrw_list_hide='^\./$,\.svn/$,\.hg/$,\.pyc$,\.svn$,\.gz$,\.tgz$,\.exe$,\.zip$'
let NERDTreeIgnore=['develop-eggs', 'parts$', '^\./$', '\.svn/$', '\.hg/$', '\.pyc$', '\.egg-info', '\.svn$', '\.gz$', '\.tgz$', '\.exe$', '\.zip$']
let g:netrw_hide=1
let g:bufExplorerShowRelativePath=1

""""""""""""""""""""""""""""""""""""""""""
" MAPPING
""""""""""""""""""""""""""""""""""""""""""

"vmap <Tab> >>
"map <Tab> W
"map <S-Tab> B

map  <F2>   :wa!<CR>
imap <F2>   <Esc>:wa!<CR>

map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
map <C-Up> <PageUp>
map <C-Down> <PageDown>

map <S-M> <PageDown>
map <S-L> <PageUp>
map <C-P> :w<CR>:bp<CR>

map <C-H> <C-W>h
map <C-L> <C-W>l
map h <C-W>h
map l <C-W>l

imap <C-H> <Left>
imap <C-J> <Esc>Bi
imap <C-K> <Esc>Wi
imap <C-L> <Right>

imap <C-X> <C-X>s

imap <C-B> <Esc>ldwi

map ff :call system('open /Applications/Firefox.app')<CR>
map tt :call system('open /Applications/iTerm.app')<CR>

map ,b :BufExplorer<CR>
map ,w :wall<CR>
map ,q :wqall<CR>
map ,o :only<CR>

map ,g :vimgrep <cword> %:p:h/*<CR>:cwindow<CR>
map ,c :call histadd(':','edit '.substitute(expand('%:p:h'),$HOME,"~","").'/')<CR>:<Up>
map ,e :edit %:p:h<CR>:5<CR>
map ;e :split %:p:h<CR>:5<CR>
map ;v :vsplit %:p:h<CR>:5<CR>
map ;t :tabfirst<CR>

map ,p :CtrlP<CR>

