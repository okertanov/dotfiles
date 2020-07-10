"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
" My personal Vim script
" Oleg Kertanov (c) 2002-2003-2004-2009-2010-2011
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set fenc=utf-8 :

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Common settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen
" https://github.com/tpope/vim-pathogen
" http://vim-scripts.org/
filetype off
call pathogen#runtime_append_all_bundles()
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
source $VIMRUNTIME/mswin.vim
behave mswin
set nocompatible
set tabstop=4
set shiftwidth=4
set smarttab
set et
set hidden
set ai
set cin
set si
set cf
set ffs=unix,dos,mac
set showmatch
set hlsearch
set incsearch
set ignorecase
set lsp=0
set lbr
set title
set wildmenu
set wildignore+=.hg,.git,.svn
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wcm=<Tab>
set lz
set scrolloff=3
set backspace=indent,eol,start
set nowrap
set formatoptions+=l
set wrapmargin=5
set antialias
set t_Co=256
set shortmess=aOstTI
set shortmess=atI
set statusline=%F%m%r%h%w\ [FMT=%{&ff}]\ [TYPE=%Y]\ [DEC=\%03.3b]
               \\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
set ve=block
set modeline
set ruler
set showcmd
set showmode
"set clipboard+=unnamed
set viminfo='10,\"100,:20,%,n~/.viminfo
set isk+=_,$,@,%,#,-
syntax on
filetype plugin indent on
set linespace=1
set cursorline
set gcr=n:blinkon0
set formatoptions-=o
nmap <Space> <PageDown>
set nofoldenable
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key
let mapleader = ","
let maplocalleader = ","
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" No f*king beep please
set noerrorbells
set novisualbell
autocmd VimEnter * set vb t_vb=
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab navigation
set switchbuf=usetab
map  <S-tab>  :sbprev<CR>
nmap <S-tab>  :sbprev<CR>
imap <S-tab>  <ESC>:sbprev<CR>i
map  <C-tab>  :sbnext<CR>
nmap <C-tab>  :sbnext<CR>
imap <C-tab>  <ESC>:sbnext<CR>i
" Buffer navigation
"noremap <C-TAB> :bnext<CR>
"inoremap <C-TAB> <ESC>:bnext<CR>i
"noremap <C-S-TAB> :bprevious<CR>
"inoremap <C-S-TAB> <ESC>:bprevious<CR>i
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Encodings
set encoding=utf-8
"set fileencoding=utf-8
"set termencoding=utf-8
" Autodetect
set fencs=utf-8,ucs-2,cp1251,koi8-r,cp866
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Encodings menu
menu Encoding.utf-8        :e ++enc=utf-8<CR>
menu Encoding.unicode      :e ++enc=ucs-2<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
map <F8> :emenu Encoding.<TAB>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Tuning
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" File Browser
nmap <silent> <C-O> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete tuning
set complete="" "reset
set complete+=. "current buffer
set complete+=k "vocabulary
set complete+=b "open buffers
set complete+=t "tags
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Paragraph format
nnoremap Q gqap
vnoremap Q gq
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
" Syntax tuning
autocmd BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mowa set filetype=scheme
au FileType markdown setlocal nofoldenable

" Save all open buffers when focus lost
autocmd BufLeave,FocusLost silent! wall

" Build & Debug
autocmd FileType lua nmap <F5> :!lua "%"<cr>
autocmd FileType c,cpp,c++ nmap <F5> :make<cr>

" Vim-Pipe plugin & autocmd
set splitright
noremap <M-r> :call VimPipe()<CR>
inoremap <M-r> <ESC>:call VimPipe()<CR>i
autocmd FileType javascript let b:vimpipe_command="node"
autocmd FileType scheme let b:vimpipe_command="racket -i"

" View binary files
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufReadPost *.odt silent %!odt2txt "%"

" omni-completion
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete
autocmd FileType cpp        set omnifunc=ccomplete#Complete
autocmd FileType cpp        set ft=cpp.c

" Bram Moolenaar <Bram@vim.org>
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif " has("autocmd")
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"                       GUI
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal & Mouse
if !has('gui_running')
set mouse=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme & Fonts
if has("gui_running")
    if has("win32")
        set guifont=Consolas:h13:cRUSSIAN::
        let g:solarized_termcolors=256
        set background=light
        colorscheme solarized
    elseif has('unix')
        "set guifont=Terminus\ 14
        let g:solarized_termcolors=256
        set background=light
        colorscheme solarized
    elseif has('macunix')
        set guifont=Menlo:h16
        colorscheme molokai
    endif
else
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
endif
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Font selection
map <F12> <ESC>:set guifont=*<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc mapping
map <silent> <F9> :call FA()<CR>
map <silent> <S-F9> zE

""""""""""""""""""""""""""""""""""""""""""""""""""
" UI tweaks: list characters, toolbar & menubar hide/show
if has("gui")
    set listchars=tab:»·
    set list

    set guioptions-=T "get rid of toolbar
    :let g:toggleTool = 0
    map <silent> <S-F1> :if g:toggleTool == 1<CR>:set guioptions-=T<CR>
                        \:let g:toggleTool = 0<CR>:else<CR>
                        \:set guioptions+=T<CR>:let g:toggleTool = 1<CR>
                        \:endif<CR>
    set guioptions-=m "get rid of menu
    :let g:toggleMenu = 0
    map <silent> <S-F2> :if g:toggleMenu == 1<CR>:set guioptions-=m<CR>
                        \:let g:toggleMenu = 0<CR>:else<CR>
                        \:set guioptions+=m<CR>:let g:toggleMenu = 1<CR>
                        \:endif<CR>

    set guioptions-=L " Left scrollbar
    set guioptions-=r " Right scrollbar (may be R aswell)
    set guioptions+=e " Buffer tabification
    "set guioptions+=c " Console-based dialogs
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Maiximized Window
if has("gui")
    if has("win32")
        au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
    elseif has("gui_gtk2")
        " au GUIEnter * :set lines=99999 columns=99999
    elseif has('macunix')
        set fuoptions=maxvert,maxhorz
    endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide ~ files
if has("win32")
set   backupdir=c:\tmp
set   directory=c:\tmp
elseif has("win32unix")
set   backupdir=c:/tmp
set   directory=c:/tmp
else
set   backupdir=/tmp
set   directory=/tmp
endif
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML Renderer
let g:html_use_css = "1"
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off 'Show list characters'
if has("gui")
    nnoremap <S-F4> :set nolist<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Spell-Checking.
if has("spell")
    set spell spelllang=en_us
    nnoremap <F4> :set spell! spell?<CR>
    imap <F4> <c-o><F4>
    vmap <F4> <c-o><F4>
    set nospell
endif
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"                dotfiles collection
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/cypher/dotfiles/blob/master/vimrc
" https://github.com/akitaonrails/vimfiles
" http://vim-scripts.org/

" Relative numvering
"if (v:version >=703)
"    set relativenumber
"endif

" Show current line
"set cursorline
"set cursorcolumn

" Automatically reread changed externally
set autoread

" Useful trick to `sudo' after editing
cmap w!! w !sudo tee % >/dev/null

" Useful leaders
" leader-w - strips all trailing whitespace from current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" leader-e - opens an edit command with the path of the currently edited file
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" leader-t - new tab
nmap <Leader>t :tabnew<CR>
" leader-T - tabify all buffers
nmap <Leader><SPACE> :tab sball<CR>

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Right border line
if (v:version >=703)
    set colorcolumn=100
    hi ColorColumn ctermbg=red ctermfg=white guibg=#592929
endif

" Match < > with the % command
set matchpairs+=<:>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"               Programming stuff
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings to jump to the beginning of functions
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Error Browser
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Build via make
if has("win32")
set         makeprg=make
else
set         makeprg=make
endif
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"spell check when writing commit logs
autocmd filetype svn,*commit* set spell
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" h/cpp file toggle
let g:lastfile = ""
nmap <C-F9> :call SwitchHeaderAndCode()<CR>

function! SwitchHeaderAndCode()
  let l:basefile = expand("%:t:r")
  let l:ext = expand("%:e")
  let l:oldfile = expand("%")

  if g:lastfile
    exec "find " . g:lastfile
  elseif l:ext == "cpp"
    let g:lastfile = expand("%")
    exec "find " . l:basefile . ".h"
  elseif l:ext == "h"
    let g:lastfile = expand("%")
    exec "find " . l:basefile . ".cpp"
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" clojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" python
if has("python")
python << EOF
import vim

def BufferName():
    buffer = vim.current.buffer #returns the current buffer
    print buffer.name

EOF
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" EOF
""""""""""""""""""""""""""""""""""""""""""""""""""
