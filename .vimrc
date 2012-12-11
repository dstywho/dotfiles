filetype plugin on " Automatically Detect file types
set nocompatible "no vi compatability
syntax on
set syntax=log

set paste
set mouse=a
set background=dark
set t_Co=256 " 256 colors
"set t_Co=256 " 256 colors
"hi Normal ctermfg=252 ctermbg=237 term=standout
if &t_Co > 25
  "colorscheme ir_black
  colorscheme wombat_dustin
else
  colorscheme desert
endif

set visualbell

set timeout ttimeout timeoutlen=1000 ttimeoutlen=100

function! MyHighlight(name, fg, bg, mod)
  execute "hi ".a:name." ctermfg=".a:fg['ansi']." ctermbg=".a:bg['ansi']." cterm=".a:mod." guifg=".a:fg['hex']." guibg=".a:bg['ansi']."gui=".a:mod                                                                                           
endfunction

" wildmenu
set wildmenu
set wildignore+=*.so,*.swp,*.zip,*/bin/*,*bin*,*/target/*,*.sw?


" hidden chars
set nolist
set listchars=tab:▶▶,trail:◀,extends:»,precedes:«,eol:¬
highlight Tabs guifg=#404040 ctermfg=234
highlight ExtraWhitespace guifg=#ff0000 ctermfg=1 ctermbg=1
match Tabs /\t/
match ExtraWhitespace /\s\+$\| \+\ze\t/
syntax match debugger /debugger/
let _red= { 'hex': '#ff8787', 'ansi': '210' }
call MyHighlight('ExtraWhitespace', _red , _red, 'none')
call MyHighlight('debugger', _red , _red, 'none')

" Tabs *******************************************
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
filetype indent on


"set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

"set ch=2
" Line Wrappin********************************************************
set nowrap
set linebreak  " Wrap at word

" Cursor highlights ********************************************
set cursorline

set hlsearch

set foldmethod=indent
set foldlevel=10

"shortcuts
"---------
"
"[ighlight search and spelling off
nnoremap <BS> :nohlsearch<cr>:setlocal nospell<cr>
"spelling on
nmap <leader>sp :setlocal spell<CR>
"toggle expanding tabs
nmap <leader>t :setlocal expandtab! expandtab?<CR>
"toggle showing hidden characters
nmap <leader>l :setlocal list! list?<CR>
nmap <leader>r :so ~/.vimrc<CR>
"toggle search wrap
nmap <leader>/ :setlocal ws! ws?<CR>



"tcomment plugin
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = '<leader>c'
let g:tcommentMapLeaderOp2 = 'gC'

"large file plugin
let g:LargeFile=100

"fuzzy finder
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class$|bin/|*sandbox/|\.pyc$|*target/'
let g:fuf_modesDisable = [] "turn on mru
"nmap <leader>ff :FufRenewCache<CR>:FufFile **/<CR>
nmap <leader>ff :CtrlP<CR>
nmap <leader>fb :FufBuffer<CR>
nmap <leader>fd :FufDir<CR>
nmap <leader>fm :CtrlPMRU<CR>
nmap <leader>fh :CtrlPMRU<CR>
"nmap <leader>fm :FufMruFile<CR>
"nmap <leader>fh :FufMruFile<CR>
nmap <leader>fj :FufJumpList<CR>
nmap <leader>ft :FufTag<CR>
nmap <leader>fc :FufChangeList<CR>
nmap <leader>fq :FufQuickFix<CR>
nmap <leader>b :CtrlPBuffer<CR>

"nerd tree
nmap <leader>d :NERDTreeToggle<CR>
"map <C-T> :FufFile<CR>

"FufBuffercontrol-P
let g:ctrlp_map = ''
nmap <leader>pp :CtrlP<CR>
nmap <leader>pm :CtrlPMRU<CR>
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>pa :CtrlPMixed<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c->>'],
    \ 'PrtHistory(1)':        ['<c-<>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-j>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-h>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }
let g:ctrlp_match_window = 'results:100'

"Fugitive
nmap <leader>g :Gstatus<CR><C-w>10+
nmap <leader>gc :Gcommit<CR><C-w>10+
nmap <leader>gd :Gdiff<CR>
nmap <leader>gdd <CR>:Gdiff<CR>

"Git Gutter
nmap <leader>gg :GitGutterToggle<CR>

"Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['foo', 'bar'],
                           \ 'passive_filetypes': ['java'] }





"stop annoying key from getting in the way
:nmap <F1> <nop>
map <F1> <Esc>
imap <F1> <Esc>



"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


"Vundle Bundles
Bundle 'Tabular'
Bundle 'tpope/vim-surround'
Bundle 'L9'
Bundle 'git://github.com/vim-scripts/FuzzyFinder.git'
Bundle 'LargeFile'
Bundle 'Markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/vim-scripts/mru.vim.git'
Bundle 'git://github.com/vim-ruby/vim-ruby.git'
"Bundle 'git://github.com/spolu/dwm.vim.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
"Bundle 'git://github.com/skammer/vim-css-color.git'
"Bundle 'git://github.com/dhazel/conque-term.git'
"Bundle 'git://github.com/vim-scripts/mail.vim.git'
"Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
Bundle 'git://github.com/klen/python-mode.git'
Bundle 'git://github.com/vim-scripts/tComment.git'
Bundle 'git://github.com/airblade/vim-gitgutter.git'
Bundle 'git://github.com/solars/github-vim.git'




" Status Line**************************************************
set showcmd
set ruler " Show ruler
set statusline=%1*%m%h%w                      "flags
set statusline+=%2*%r                      "flags
set statusline+=%*\ %F\ %=                         "filename
set statusline+=%4*\ row:%l/%L\ %p%%\               "row
set statusline+=%5*\ col:%v\                        "column
set statusline+=%6*\%{(&expandtab)?'':'\ tabs\ '}       "file encoding
set statusline+=%7*\%{(&tabstop!=2)?'tabstop:'.&tabstop:''}       "file encoding
set statusline+=%8*\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}

"set statusline+=%5*\ %{strlen(&fenc)?&fenc:'none'}\ "file encoding
"set statusline+=%6*\ %{&ff}\                        "file format
hi User1 guibg=#eea040 guifg=#ffffff ctermfg=234 ctermbg=39
hi User2 guibg=#ff66ff guifg=#222222 ctermfg=234 ctermbg=132
hi User3 guibg=#dd3333 guifg=#222222 ctermfg=234 ctermbg=117
hi User4 guibg=#a0ee40 guifg=#222222 ctermfg=234 ctermbg=114
hi User5 guibg=#eeee40 guifg=#222222 ctermfg=234 ctermbg=167
hi User6 guibg=#eeee40 guifg=#222222 ctermfg=234 ctermbg=118
hi User7 guibg=#eeee40 guifg=#222222 ctermfg=234 ctermbg=119

syn match OperatorAnnex display '\.'
hi def link OperatorAnnex Operator

map <F5> <Plug>GithubOpen
map <F6> <Plug>GithubComment

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
