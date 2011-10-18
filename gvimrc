"set cuc
set cul
set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text

set gfn=Inconsolata:h16
set guioptions-=T

set columns=160
set lines=70

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

au WinEnter * setlocal relativenumber
au WinLeave * setlocal norelativenumber

let g:solarized_bold=0
let g:solarized_italic=0

" needed for easymotion to nicely highlight latex documents
autocmd Filetype tex hi link EasyMotionTarget ErrorMsg 
autocmd Filetype tex hi link EasyMotionShade  Comment