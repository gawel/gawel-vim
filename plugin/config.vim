set statusline=%F%m%r%h%w\ format=%{&ff}\ type=%Y\ x=%l\ y=%v\ %p%%\ %{strftime(\"%d/%m/%y\ -\%H:%M\")}
set grepprg=grep\ -R\ --exclude=\"*.pyc\"\ $*\ *\ /dev/null
let g:explDetailedHelp=0
let g:netrw_list_hide='^\./$,\.svn/$,\.hg/$,\.pyc$,\.svn$,\.gz$,\.tgz$,\.exe$,\.zip$'
let NERDTreeIgnore=['develop-eggs', 'parts$', '^\./$', '\.svn/$', '\.hg/$', '\.pyc$', '\.egg-info', '\.svn$', '\.gz$', '\.tgz$', '\.exe$', '\.zip$']
let g:netrw_hide=1
let g:bufExplorerShowRelativePath=1
filetype indent on

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

imap <C-B> <Esc>ldwi

map ff :call system('open /Applications/Firefox.app')<CR>
map tt :call system('open /Applications/iTerm.app')<CR>

map ,b :BufExplorer<CR>
map ,w :wall<CR>
map ,q :wqall<CR>
map ,o :only<CR>

map ,g :vimgrep <cword> %:p:h/*<CR>:cwindow<CR>
map ,c ,e:call histadd(':','edit '.substitute(expand('%:p:h'),$HOME,"~","").'/')<CR>:<Up>
map ,t ;t:call histadd(':','edit '.substitute(expand('%:p:h'),$HOME,"~","").'/')<CR>:<Up>
map ,e :edit %:p:h<CR>:5<CR>
map ;e :split %:p:h<CR>:5<CR>
map ;v :vsplit %:p:h<CR>:5<CR>
map ;t :tabfirst<CR>

map ,p :open ~/bear/pytheon/src/pytheon<CR>,e/
map ;p :split ~/bear/pytheon/src/pytheon<CR>,e/

""""""""""""""""""""""""""""""""""""""""""
" ENV
""""""""""""""""""""""""""""""""""""""""""
let winManagerWindowLayout = 'FileExplorer|TagList'

""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""

" charset function
command! ToUnixFormat :set fileformat=unix

command! ToUtf8 call FuToUtf8()
function! FuToUtf8()
    silent! set encoding=utf-8
    silent! set fileencoding=utf-8
    silent! set termencoding=iso-8859-15
endfunction

if has("multi_byte")
    call FuToUtf8()
endif


