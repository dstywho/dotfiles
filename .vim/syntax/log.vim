if exists("b:current_syntax")
  finish
endif


syn match err "SEVERE.*"
syn match fail "Test Failed.*"
syn match warning "WARNING.*"
syn match starting "Starting.*"
syn match finished "Finished.*"




hi def link fail err

hi def link starting Keyword
hi def link finished Keyword

hi err guifg=red guibg=NONE gui=undercurl ctermfg=red ctermbg=none cterm=NONE guisp=#FF6C60 " undercurl color
hi warning guifg=yellow guibg=NONE gui=undercurl ctermfg=yellow ctermbg=none cterm=NONE guisp=#FF6C60 " undercurl color


