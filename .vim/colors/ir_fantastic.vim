" ir_black color scheme
" More at: http://blog.infinitered.com


" ********************************************************************************
" Standard colors used in all ir_black themes:
" Note, x:x:x are RGB values
"
"  normal: #f6f3e8
"
"  string: #A8FF60  168:255:96                  
"    string inner (punc, code, etc): #00A0A0  0:160:160
"  number: #FF73FD  255:115:253                
"  comments: #7C7C7C  124:124:124
"  keywords: #96CBFE  150:203:254            
"  operators: white
"  class: #FFFFB6  255:255:182
"  method declaration name: #FFD2A7  255:210:167
"  regular expression: #E9C062  233:192:98
"    regexp alternate: #FF8000  255:128:0
"    regexp alternate 2: #B18A3D  177:138:61
"  variable: #C6C5FE  198:197:254
" 
" Misc colors:
"  red color (used for whatever): #FF6C60   255:108:96
"     light red: #FFB6B0   255:182:176
"
"  brown: #E18964  good for special
"
"  lightpurpleish: #FFCCFF
"
" Interface colors:
"  background color: black
"  cursor (where underscore is used): #FFA560  255:165:96
"  cursor (where block is used): white
"  visual selection: #1D1E2C 
"  current line: #151515  21:21:21
"  search selection: #07281C  7:40:28
"  line number: #3D3D3D  61:61:61


" ********************************************************************************
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #FFB6B0
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #FFFFCB
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF


" ********************************************************************************
set background=dark
hi clear
set bg&

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ir_black"

hi SignColumn guibg=NONE ctermbg=NONE

let _hpink= { 'hex': '#ff00ff', 'ansi': '125' }
let _pink= { 'hex': '#ff00ff', 'ansi': '177' }
let _purple_pastel= { 'hex': '#afafff', 'ansi': '147' }
let _purple= { 'hex': '#afafff', 'ansi': '141' }
let _yellow= { 'hex': '#ffaf00', 'ansi': '228' }
let _white = { 'hex': '#ffffff', 'ansi': '15' }
let _dgrey= { 'hex': '#262626', 'ansi': '235' }
let _grey= { 'hex': '#9e9e9e', 'ansi': '247' }
let _red= { 'hex': '#ff8787', 'ansi': '9' }
let _rred= { 'hex': '#ff8787', 'ansi': '168' }
let _light_green= { 'hex': '#d7ff87', 'ansi': '192' }
let _green= { 'hex': '#008000', 'ansi': '28' }
let _dgreen= { 'hex': '#008000', 'ansi': '22' }
let _mgreen= { 'hex': '#008000', 'ansi': '115' }
let _blue = { 'hex': '#87d7ff', 'ansi': '81' }
let _none= { 'hex': 'none', 'ansi': 'none' }
let _black= { 'hex': '121212', 'ansi': '233' }

function! MyHighlight(name, fg, bg, mod)
  execute "hi ".a:name." ctermfg=".a:fg['ansi']." ctermbg=".a:bg['ansi']." cterm=".a:mod." guifg=".a:fg['hex']." guibg=".a:bg['ansi']."gui=".a:mod
endfunction

"hi Example         guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" General colors
hi Normal guifg=#f6f3e8 guibg=black gui=NONE 
hi NonText guifg=#070707 guibg=black gui=NONE ctermfg=128  ctermbg=NONE cterm=NONE

hi Cursor           guifg=black       guibg=white       gui=NONE      ctermfg=white       ctermbg=white       cterm=reverse

"line number
hi LineNr           guifg=#3D3D3D     guibg=black       gui=NONE      ctermfg=239         ctermbg=None       cterm=NONE

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE      ctermfg=darkgray    ctermbg=darkgray   cterm=NONE
"hi StatusLine       guifg=#FF7575     guibg=#f7f5f5     gui=italic    ctermfg=233         ctermbg=254        cterm=NONE
hi StatusLineNC     guifg=black       guibg=#999995     gui=NONE      ctermfg=235         ctermbg=244        cterm=NONE 

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=67        ctermbg=NONE        cterm=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=66        ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE        ctermbg=NONE      cterm=REVERSE

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu         guifg=green       guibg=yellow      gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
"hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE


" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#C6C5FE     gui=BOLD      ctermfg=black       ctermbg=117        cterm=BOLD

hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD      ctermfg=white       ctermbg=darkgray    cterm=NONE
hi CursorColumn   guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
"hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=236         cterm=none
hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE      ctermfg=250         ctermbg=240        cterm=NONE
hi PmenuSel       guifg=#000000     guibg=#cae682     gui=NONE      ctermfg=195         ctermbg=243        cterm=NONE
hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=NONE        ctermbg=54          cterm=underline


" Syntax highlighting
call MyHighlight('Comment'     , _grey          , _none , 'none')
call MyHighlight('String'      , _yellow, _none , 'none')
call MyHighlight('Keyword'     , _blue          , _none , 'bold')
call MyHighlight('PreProc'     , _blue          , _none , 'none')
call MyHighlight('Number'      , _rred          , _none , 'none')
call MyHighlight('Conditional' , _blue          , _none , 'none')
call MyHighlight('Statement'   , _blue          , _none , 'none')
call MyHighlight('Todo'        , _hpink , _none , 'none')

"symbol
call MyHighlight('Constant'    , _purple, _none , 'none')

call MyHighlight('Type'        , _blue, _none , 'none') "class name
call MyHighlight('Function'    , _purple, _none , 'none')
call MyHighlight('Delimiter'   , _yellow, _none , 'none')
call MyHighlight('Operator'    , _hpink , _none , 'none')
call MyHighlight('Special'     , _pink          , _none , 'none')
call MyHighlight('Identifier'  , _purple_pastel , _none , 'none')
"hi Comment          guifg=#7C7C7C     guibg=NONE        gui=NONE      ctermfg=gray     ctermbg=NONE        cterm=italic
"hi String           guifg=#A8FF60     guibg=NONE        gui=NONE      ctermfg=157      ctermbg=NONE        cterm=NONE
"hi Number           guifg=#FF73FD     guibg=NONE        gui=NONE      ctermfg=177      ctermbg=NONE        cterm=NONE

"hi Keyword          guifg=#96CBFE     guibg=NONE        gui=NONE      ctermfg=117        ctermbg=NONE        cterm=NONE
"hi PreProc          guifg=#96CBFE     guibg=NONE        gui=NONE      ctermfg=117        ctermbg=NONE        cterm=NONE
"hi Conditional      guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end

"hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
"hi Constant         guifg=#99CC99     guibg=NONE        gui=NONE      ctermfg=158        ctermbg=NONE        cterm=NONE

"hi Identifier       guifg=#C6C5FE     guibg=NONE        gui=NONE      ctermfg=147         ctermbg=NONE        cterm=NONE
"hi Function         guifg=#FFFFB6     guibg=NONE        gui=NONE      ctermfg=229         ctermbg=NONE        cterm=NONE
"hi Type             guifg=#FFFFB6     guibg=NONE        gui=NONE      ctermfg=229         ctermbg=NONE        cterm=NONE
"hi Statement        guifg=#AED0E6     guibg=NONE        gui=NONE      ctermfg=117         ctermbg=NONE        cterm=NONE

"`hi Special          guifg=#E18964     guibg=NONE        gui=NONE      ctermfg=219         ctermbg=NONE        cterm=NONE
"`hi Delimiter        guifg=#00A0A0     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
"`hi Operator         guifg=white       guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

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


" Special for Ruby
"hi rubyRegexp                  guifg=#B18A3D      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi  link  rubyRegexp                                   String
hi  link  rubyRegexpDelimiter                          String
hi  link  rubyEscape                                   Keyword
hi  link  rubyInterpolationDelimiter                   Keyword
hi  link  rubyControl                                  Keyword
hi  link  rubyGlobalVariable                           Keyword
hi  link  rubyStringDelimiter                          Delimiter



"hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
"hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=white           ctermbg=NONE      cterm=NONE
"hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=66             ctermbg=NONE      cterm=NONE
"hi rubyControl                 guifg=#6699CC      guibg=NONE      gui=NONE      ctermfg=117            ctermbg=NONE      cterm=NONE  "and break, etc
""hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
"hi rubyStringDelimiter         guifg=#336633      guibg=NONE      gui=NONE      ctermfg=77             ctermbg=NONE      cterm=NONE
"rubyInclude
"rubySharpBang
"rubyAccess
hi link rubyPredefinedVariable Identifier
"rubyBoolean
hi link rubyClassVariable Identifier
"rubyBeginEnd
hi link rubyRepeatModifier Identifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type 


" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier
hi link javaCommentTitle      javaDocSeeTag
hi link javaDocTags           javaDocSeeTag
hi link javaDocParam          javaDocSeeTag
hi link javaDocSeeTagParam    javaDocSeeTag

hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
"hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE


" Special for XML
hi link xmlTag          Keyword
hi link xmlTagName      Conditional
hi link xmlEndTag       Identifier


" Special for HTML
hi link htmlTag         Keyword
hi link htmlTagName     Conditional
hi link htmlEndTag      Identifier


" Special for Javascript
hi link javaScriptNumber      Number


" Special for Python
"hi  link pythonEscape         Keyword     


" Special for CSharp
hi  link csXmlTag             Keyword     

"setlist character colors
hi NonText guifg=#404040 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#404040 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE

"spelling
hi SpellBad guifg=red guibg=#121212 gui=NONE ctermfg=red ctermbg=236 cterm=underline


hi User1 guibg=#00AFFF guifg=#404040 ctermfg=234 ctermbg=39
hi User2 guibg=#87D7FF guifg=#404040 ctermfg=234 ctermbg=117
hi User3 guibg=#AF5F87 guifg=#404040 ctermfg=234 ctermbg=132
hi User4 guibg=#87D787 guifg=#404040 ctermfg=234 ctermbg=114
hi User5 guibg=#87D7FF guifg=#404040 ctermfg=234 ctermbg=167
hi User6 guibg=#87D7FF guifg=#404040 ctermfg=234 ctermbg=118
hi User7 guibg=#87D7FF guifg=#404040 ctermfg=234 ctermbg=119

syn match OperatorAnnex display "||\|?\|+\|-\|&\|*\|<\|>\|:"
hi def link OperatorAnnex Operator
