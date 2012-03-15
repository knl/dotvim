setlocal noexpandtab                         " use tabs, not spaces

setlocal autoindent
setlocal nopreserveindent
setlocal copyindent
setlocal smartindent

setlocal softtabstop=0
setlocal tabstop=4                           " tabstops of 8
setlocal shiftwidth=4                        " indents of 8
setlocal textwidth=78                        " screen in 80 columns wide, wrap at 78
setlocal cindent
"setlocal cino=
setlocal cinoptions=(0,u0,U0
setlocal eol

" Always do backups for C files
setlocal backup

nmap <C-J> vip=                         " forces (re)indentation of a block of code

syn keyword cType uint ubyte ulong boolean_t 
syn keyword cType uint64_t uint32_t uint16_t uint8_t 
syn keyword cType int64_t int32_t int16_t int8_t 
syn keyword cType u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely

syn match ErrorLeadSpace /^ \+/         " highlight any leading spaces
syn match ErrorTailSpace / \+$/         " highlight any trailing spaces
syn match Error80            /\%>80v.\+/    " highlight anything past 80 in red

hi link Error80 		ErrorMsg
hi link ErrorLeadSpace  Error
hi link ErrorTailSpace  ErrorMsg

set formatoptions=tcqlron
"set cinoptions=:0,l1,t0,g0

" Returns a number which is the indent level of the current line
function! s:GetIndentLevel ()
    return strlen (matchstr (getline ('.'), '^\t*'))
endfunction

function! SmartIndent ()
    " Do nothing if appropriate
    let lastchar = strpart (getline ('.'), col('.')-2)
    if lastchar == ')' || lastchar == '{'
        return "\<CR>"
    endif

    let tabs = matchstr (getline ('.'), '^\t*')
    if (getline ('.') =~ '^\t* \+')
        " We're already doing alignment
        let nspaces = strlen (matchstr (getline ('.'), '^\t* \+')) - strlen (tabs)
    else
        let par_idx = strridx (getline ('.'), '(')
        if (par_idx == -1)
            return "\<CR>"
        else
        let nspaces = par_idx - strlen (tabs) + 1
        endif
    endif
    let spaces = ""
    let i = 0

    while i < nspaces
        let spaces = spaces . " "
        let i = i+1
    endwhile

    return "\<CR>\<C-W>".tabs.spaces
endfunction

"inoremap <S-CR> <C-R>=SmartIndent()<CR>
