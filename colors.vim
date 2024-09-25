
hi clear
if exists('syntax_on') | syntax reset | endif

let g:colors_name = 'game'
set background=dark

set termguicolors

hi! Normal    guibg=#000000 guifg=#eeeeee
hi! Player                  guifg=#ffee8c
" TODO hi! MapHidden               guifg=#000000
hi! Conceal                               gui=bold 
