set expandtab     " Tabs are spaces
setlocal tabstop=4     " Tab stop
setlocal shiftwidth=4  " Shift width
setlocal softtabstop=4  " Shift width

let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
let g:pymode_lint_checker = "pep8"

"Check code every save
let g:pymode_lint_write = 1

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 0

" Place error signs
let g:pymode_lint_signs = 1

" Maximum allowed mccabe complexity
let g:pymode_lint_mccabe_complexity = 8

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6
