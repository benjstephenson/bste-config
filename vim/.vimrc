"================================================================
"Vim Resource File
"Ben Stephenson
"================================================================

"Set terminal to 256 colours
if &term =~ "xterm" || &term =~ "screen"
"  "256 color --
  let &t_Co=256
	if &term !~ "screen"
		" restore screen after quitting
		set t_ti=7[r[?47h t_te=[?47l8
	endif

  if has("terminfo")
    "let &t_Sf="[3%p1%dm"
    "let &t_Sb="[4%p1%dm"
    set t_AB=[48;5;%dm
    set t_AF=[38;5;%dm
  else
    let &t_Sf="[3%dm"
    let &t_Sb="[4%dm"
  endif
endif

"=================================================================
"Vundle
"=================================================================
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"Bundle 'FuzzyFinder'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'L9'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
"Bundle 'mbadran/headlights'
Bundle 'nanotech/jellybeans.vim'
"Bundle 'peterhoeg/vim-qml'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/MatchTagAlways'
Bundle 'wesleyche/SrcExpl'
Bundle 'wesleyche/Trinity'
Bundle 'scrooloose/nerdtree'
Bundle 'ejholmes/vim-forcedotcom'
Bundle 'vim-scripts/groovy.vim'

"Bundle 'SirVer/ultisnips'
" SnipMate and dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/snipmate.vim'
Bundle 'msanders/snipmate.vim'

Bundle 'tpope/vim-fugitive'

" VimSIDE
"Bundle 'megaannum/self'
"Bundle 'megaannum/forms'
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/vimshell'
"Bundle 'aemoncannon/ensime'
"Bundle 'megaannum/vimside'

"=================================================================
"General Options
"=================================================================
"Set this first as some other features depend on it.
filetype plugin on

set nocp

set nu
set autoread
set hlsearch              "Highlights search results, clear with :noh
set incsearch             "Incremental search as you type
set keywordprg=man        "search for word under cursor using |keywordprg|
set cmdheight=1           "Set cmd window to 1 lines
set wildmenu              "turn on wild cmd menu
set laststatus=2
set cul                "Highlists the line the cursor is on
set textwidth=110

"Set tab to length of 3 spaces
set tabstop=2
set shiftwidth=2


syn on
colorscheme jellybeans

" Usig=ng netrw over NERDTree
let g:netrw_browse_split=4 "Open files in a last buffer when exploring
let g:netrw_altv=1
let g:netrw_liststyle=3    "default to tree view for directories
let g:netrw_winsize=25     "Split window size to 25% of viewport

"Add some useful places to Vim's PATH
"set path+=./source,.*
set path+=$HOME/.vim/plugin/*
set path+=$PWD/**

" PowerBar is better
"set statusline=\[FILE=%F%m%R\]\ \[TYPE=%Y\]\ \[POS=ln%l\ col%c\ %P\]\ \[LINES=%L\]

" Auto remove trailing whitespace on file save
"autocmd BufWritePre * :%s/\s\+$//e
"=================================================================
" Bundle Settings
"=================================================================
"SrcExpl
let g:SrcExpl_pluginList = [
	\ "__NERD_tree__",
	\ "__Tagbar__"
\ ]


"Tagbar
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }

"let type_scala = {}
"let type_scala.ctagstype = 'Scala'
"let type_scala.kinds     = [
"  \ {'short' : 'p', 'long' : 'packages',  'fold' : 1 },
"  \ {'short' : 'V', 'long' : 'values',    'fold' : 0 },
"  \ {'short' : 'v', 'long' : 'variables', 'fold' : 0 },
"  \ {'short' : 'T', 'long' : 'types',     'fold' : 0 },
"  \ {'short' : 't', 'long' : 'traits',    'fold' : 0 },
"  \ {'short' : 'o', 'long' : 'objects',   'fold' : 0 },
"  \ {'short' : 'a', 'long' : 'aclasses',  'fold' : 0 },
"  \ {'short' : 'c', 'long' : 'classes',   'fold' : 0 },
"  \ {'short' : 'r', 'long' : 'cclasses',  'fold' : 0 },
"  \ {'short' : 'm', 'long' : 'methods',   'fold' : 0 }
"\ ]
"let type_scala.sro        = '.'
"let type_scala.kind2scope = {
"  \ 'T' : 'type',
"  \ 't' : 'trait',
"  \ 'o' : 'object',
"  \ 'a' : 'abstract class',
"  \ 'c' : 'class',
"  \ 'r' : 'case class'
"\ }
"let type_scala.scope2kind = {
"  \ 'type'           : 'T',
"  \ 'trait'          : 't',
"  \ 'object'         : 'o',
"  \ 'abstract class' : 'a',
"  \ 'class'          : 'c',
"  \ 'case class'     : 'r'
"\ }

au FileType * call tagbar#autoopen(0)

" Match Tag Alwas
let g:mta_filetypes = {
    \ 'html'  : 1,
    \ 'xhtml' : 1,
    \ 'xml'   : 1,
    \ 'jinja' : 1,
		\ 'js'    : 1,
    \}


" UltiSnips
"let g:UltiSnipsExpandTrigger = '<c-l>'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:UltiSnipsListSnippets = '<c-m>'

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB
" key
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

"exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"==================================================================
"Fold Setup
"==================================================================
"Set the folding options
set foldmarker={{{,}}}     "Set a marker to use when foldmethod is |marker|
set foldmethod=marker
set foldcolumn=2          "Set the width of the lh column which shows fold marks
set foldminlines=5        "Set the min number of lines to make a fold
set foldopen-=search      "Don't open folds when searching


"If we've made some nice folds, save them when we leave and reload them when
"we comeback, but not if it's a ro file or we're in diff mode
if !&diff
  if !&readonly
    au BufWinLeave *.c mkview
    au BufWinEnter *.c silent loadview
  endif
endif

"Keymaps for folding
"Key = <C-f>s
noremap s :set fdm=syntax
"Key=<C-F>m
noremap m :set fdm=manual
"Key=<C-F>a
noremap a :set fdm=marker

"==================================================================
"Autocomplete and Tag Settings
"==================================================================
"Set autocomplete sources; dictionary, tags files etc
"Set the dictionary we would like to use for autocompletion
set tags=$HOME/.vim/tags/glibc.tags,$HOME/.vim/tags/gtkmm.tags,tags
set dict=$HOME/.vim/dictionary/*.list
set complete=.,t
set completeopt=menuone,menu,preview

set pumheight=30
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
map <F8> :!ctags --c++-kinds=+p --fields=+iaS --extra=+q *.cpp<CR>

"==================================================================
"Miscellaneous Key mappings
"==================================================================
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
fun! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d fdm=%s %set :",
        \ &tabstop, &shiftwidth, &textwidth, &fdm, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


"Close all windows and exit - careful to save beforehand
command! -nargs=0 QQ qall
command! -nargs=0 WQ wall qall

" Remap keys to move between viewports
" Key=<C-LeftArrow>
nmap [1;5D <C-W>h
" Key=<C-DownArrow>
nmap [1;5B <C-W>j
" Key=<C-UpArrow>
nmap [1;5A <C-W>k
" Key=<C-RightArrow>
nmap [1;5C <C-W>l

"Opens file under cursor in new window, if in $PATH
"Key=<Gf>
noremap Gf gf

"Turn on/off hex editing of current file
command! -nargs=* Ox %!xxd
command! -nargs=* Nox %!xxd -r

noremap <F2> "=strftime("%c")<CR>p

