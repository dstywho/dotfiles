" Vim color scheme
"
" Name:         railscasts.vim
" Maintainer:   Nick Moffitt <nick@zork.net>
" Last Change:  01 Mar 2008
" License:      WTFPL <http://sam.zoy.org/wtfpl/>
" Version:      2.1
"
" This theme is based on Josh O'Rourke's Vim clone of the railscast
" textmate theme.  The key thing I have done here is supply 256-color
" terminal equivalents for as many of the colors as possible, and fixed
" up some of the funny behaviors for editing e-mails and such.
"
" To use for gvim:
" 1: install this file as ~/.vim/colors/railscasts.vim
" 2: put "colorscheme railscasts" in your .gvimrc
"
" If you are using Ubuntu, you can get the benefit of this in your
" terminals using ordinary vim by taking the following steps:
"
" 1: sudo apt-get install ncurses-term
" 2: put the following in your .vimrc
"     if $COLORTERM == 'gnome-terminal'
"         set term=gnome-256color
"         colorscheme railscasts
"     else
"         colorscheme default
"     endif
" 3: if you wish to use this with screen, add the following to your .screenrc:
"     attrcolor b ".I"
"     termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
"     defbce "on"
"     term screen-256color-bce

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "railscasts"

hi link htmlTag                     xmlTag
hi link htmlTagName                 xmlTagName
hi link htmlEndTag                  xmlEndTag

hi Normal      guifg=#E6E1DC guibg=#111111 ctermfg=255
hi Cursor      guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=15	
hi CursorLine  guibg=#000000 ctermbg=233 cterm=NONE

hi Comment     guifg=#BC9458 ctermfg=180 gui=italic
hi String      guifg=#A5C261 ctermfg=107
hi Number      guifg=#A5C261 ctermfg=107
hi Keyword     guifg=#CC7833 ctermfg=173 cterm=NONE
hi PreProc     guifg=#E6E1DC ctermfg=103

hi Constant     guifg=#6D9CBE ctermfg=73
hi Define       guifg=#CC7833 ctermfg=173
hi Error        guifg=#FFC66D ctermfg=221 guibg=#990000 ctermbg=88
hi Function     guifg=#FFC66D ctermfg=221 gui=NONE cterm=NONE
hi Identifier   guifg=#6D9CBE ctermfg=73 gui=NONE cterm=NONE
hi Todo         guifg=#8f8f8f     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Include      guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
hi LineNr       guifg=#2B2B2B ctermfg=159 guibg=#C0C0FF
hi Search       guifg=NONE ctermfg=NONE guibg=#2b2b2b ctermbg=235 gui=italic cterm=underline
hi Statement    guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
hi Title        guifg=#FFFFFF ctermfg=15
hi Type         guifg=#DA4939 ctermfg=167 gui=NONE cterm=NONE
hi Visual       guibg=#5A647E ctermbg=60

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


highlight DiffAdd                   guifg=#E6E1DC ctermfg=7 guibg=#519F50 ctermbg=71
highlight DiffDelete                guifg=#E6E1DC ctermfg=7 guibg=#660000 ctermbg=52
highlight Special                   guifg=#DA4939 ctermfg=167 
highlight Operator guifg=#DA4939 ctermfg=167 
highlight Delimiter guifg=#DA4939 ctermfg=167 

"highlight pythonBuiltin             guifg=#6D9CBE ctermfg=73 gui=NONE cterm=NONE
"highlight rubyBlockParameter        guifg=#FFFFFF ctermfg=203
"highlight rubyClass                 guifg=#FFFFFF ctermfg=214
"highlight rubyConstant              guifg=#DA4939 ctermfg=167
"highlight rubyInstanceVariable      guifg=#D0D0FF ctermfg=189
"highlight rubyInterpolation         guifg=#519F50 ctermfg=107
"highlight rubyLocalVariableOrMethod guifg=#D0D0FF ctermfg=189
"highlight rubyPredefinedConstant    guifg=#DA4939 ctermfg=167
"highlight rubyPseudoVariable        guifg=#FFC66D ctermfg=221
"highlight rubyStringDelimiter       guifg=#A5C261 ctermfg=143

hi link rubyControl           Keyword
hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type


highlight xmlTag                    guifg=#E8BF6A ctermfg=179
highlight xmlTagName                guifg=#E8BF6A ctermfg=179
highlight xmlEndTag                 guifg=#E8BF6A ctermfg=179

highlight mailSubject               guifg=#A5C261 ctermfg=107
highlight mailHeaderKey             guifg=#FFC66D ctermfg=221
highlight mailEmail                 guifg=#A5C261 ctermfg=107 gui=italic cterm=underline

highlight SpellBad                  guifg=#D70000 ctermfg=160 ctermbg=NONE cterm=underline
highlight SpellRare                 guifg=#D75F87 ctermfg=168 guibg=NONE ctermbg=NONE gui=underline cterm=underline
highlight SpellCap                  guifg=#D0D0FF ctermfg=189 guibg=NONE ctermbg=NONE gui=underline cterm=underline
highlight MatchParen                guifg=#FFFFFF ctermfg=15 guibg=#005f5f ctermbg=23

