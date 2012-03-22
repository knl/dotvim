" .vimrc
" Author: Nikola Knezevic <laladelausanne@gmail.com>
"
" Heavily inspired by Steve Losh's .vimrc

" Preamble ---------------------------------------------------------------- {{{

filetype off
call pathogen#infect('bundles')
"call pathogen#helptags()
filetype plugin indent on
set nocompatible

" }}}

" Basic options ----------------------------------------------------------- {{{
"set cuc
"set cul
"set number
"set t_Co=256

set encoding=utf-8
set modelines=0
set nowrap              " Do not wrap words (view)
set showmatch           " Show matching brackets.
set autoread			" Set to auto read when a file is changed from the outside
set autowrite 			" write on any :next, :make and such
"set noswapfile          " do not write .swp files
set history=1000
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
set guioptions-=T       " disable toolbar"
set showmode
set showcmd
set hidden
set visualbell
set laststatus=2

set autoindent		" always set autoindenting on
set smartindent     " smart indenting
set copyindent		" copy indent from previous line on autoindent
set preserveindent  " preserve indentination

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

set fillchars=diff:⣿

set lazyredraw
set matchtime=3
set showbreak=↪

set splitbelow
set splitright

set ttimeout
set notimeout
set nottimeout
set autowrite
set autoread
set title
set linebreak

set relativenumber
set ttyfast

set cinoptions=:0,(s,u0,U1,g0,t0

set dictionary=/usr/share/dict/words

set tags=tags;/

set noeol " prevent vim from adding that stupid empty line at the end of every file
set binary

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Tabs and Spaces {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " expand tabs
set shiftround		" use a multiple of sw for <
set smarttab
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1

set guitablabel=%N/\ %t\ %M
"set formatoptions=qrn1
" }}}

" Backups {{{
set undofile
set undoreload=10000

set backup                        " enable backups
set nobackup                      " do not write backup files
set noswapfile                    " It's 2012, Vim.

set undodir=$HOME/.vim/tmp/undo     " undo files
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*" 
" }}}

" Leader {{{

let mapleader = ","
let g:mapleader = ","

let maplocalleader = "\\"
let g:maplocalleader = "\\"
" }}}

let bash_is_sh=1

" Color scheme {{{

syntax on
set background=dark

" avoid calling functions to set :colo, since it flashes nasty
colorscheme molokai
"
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" highlight the file name
hi User1 term=bold,reverse cterm=bold ctermfg=4 ctermbg=2 gui=bold guifg=Blue guibg=#44aa00

hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" }}}
" }}} 

" Read the location of external programs used by the configuration
if filereadable(expand("$HOME/.vim/external.vim"))
	source $HOME/.vim/external.vim
endif

" Save when losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Completion -------------------------------------------------------------- {{{
" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn,CVS                " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.class,*.mo,*.la,*.so,*.a
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX bullshit
set wildignore+=*.bkp
" }}}

" Completion options {{{
" insert-mode completion
set complete=.,w,b,u,U,t,i,d

set completeopt=longest,menuone,preview

" Omni completion settings
set infercase
set ofu=syntaxcomplete#Complete
" }}}
" }}}
" Searching and movement -------------------------------------------------- {{{
" Fix matching (use sane regexes)
nnoremap / /\v
vnoremap / /\v

" remove highlight on matched
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
"nnoremap <leader><space> :silent noh<cr>

set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS
set incsearch           " Incremental search
set gdefault            " Turn on global replace (//g)
set hlsearch            " Highlight search match

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

" extended '%' mapping for if/then/else/end etc
runtime macros/matchit.vim

" Made D behave
nnoremap D d$

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Window resizing
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Error navigation {{{
"
"             Location List     QuickFix Window
"            (e.g. Syntastic)     (e.g. Ack)
"            ----------------------------------
" Next      |     M-j               M-Down     |
" Previous  |     M-k                M-Up      |
"            ----------------------------------
"
nnoremap ∆ :lnext<cr>zvzz
nnoremap ˚ :lprevious<cr>zvzz
inoremap ∆ <esc>:lnext<cr>zvzz
inoremap ˚ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz
" }}}

" do not use arrow keys {{{
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

cnoremap <M-Up> <Up>
cnoremap <M-Down> <Down>
" }}}
" Directional Keys {{{

" It's 2011.
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v
" }}}

" Bash like keys for the command line {{{
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

cunmap <Left>
cunmap <Right>
" }}}

" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{

set foldcolumn=0        " columns for folding
set foldmethod=indent
set foldlevel=9
set foldlevelstart=0

" Make the current location sane.
nnoremap <c-cr> zvzz

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Various infuriating keys ------------------------------------------------ {{{

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" Don't use Ex mode, use Q for formatting
map Q gq

" when deleting single chars, don't polute yank history
noremap x "_x
"
" for mistyping :w as :W
command! W :w

" }}}
" Convenience mappings ---------------------------------------------------- {{{

nnoremap ; :

"Switch to current dir
map <leader>cd :cd %:p:h<cr>

" highlight trailing whitespace
nmap <silent> <leader>s :set nolist!<CR>

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Omni completion settings
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1
" completing Rails hangs a lot
"let g:rubycomplete_rails = 1

" Select pasted text
nnoremap <leader>v V`]

" Ctrl-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

nmap <leader>S :SessionList<CR>
nmap <leader>SS :SessionSave<CR>
nmap <leader>SA :SessionSaveAs<CR>

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

" Yank to OS X pasteboard.
noremap Y "*y

" Paste from OS X pasteboard without messing up indent.
noremap P :set paste<CR>"*p<CR>:set nopaste<CR>
" }}}
" Utility functions ------------------------------------------------------- {{{

" ShowFuncName {{{
fun! ShowFuncName()
	let lnum = line(".")
	let col = col(".")
	echohl ModeMsg
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
	echohl None
	call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <leader>f :call ShowFuncName() <CR>
" }}}

" Whitespace problem handling {{{
let c_space_errors=1
function ShowSpaces(...)
	let @/="\\v(\\s+$)|( +\\ze\\t)"
	let oldhlsearch=&hlsearch
	if !a:0
		let &hlsearch=!&hlsearch
	else
		let &hlsearch=a:1
	end
	return oldhlsearch
endfunction

function TrimSpaces() range
	let oldhlsearch=ShowSpaces(1)
	execute a:firstline.",".a:lastline."substitute ///gec"
	let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F4>     :ShowSpaces 1<CR>
nnoremap <S-F4>   m`:TrimSpaces<CR>``
vnoremap <S-F4>   :TrimSpaces<CR>
" }}}

" Bracketed paste mode {{{
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
endif
" }}}

" Make {{{
:command -nargs=* Make make <args> | cwindow 3
" }}}

" Converting tabs at the beginning
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
" }}}

" }}}
" Various filetype-specific stuff ----------------------------------------- {{{
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	autocmd Filetype tex setlocal nofoldenable tw=80 spell spelllang=en
	" When dealing with TeX, we need autocomplete of picture names
	autocmd Filetype tex setlocal wildignore-=*.jpg,*.bmp,*.gif,*.png,*.jpeg

	" C {{{

	augroup ft_c 
    	au!
    	autocmd FileType c      setlocal foldmethod=syntax nofoldenable
    	autocmd FileType cpp    setlocal foldmethod=syntax nofoldenable
		autocmd FileType objc   setlocal ts=8 sw=8 sts=8 ai  fdm=manual
		"autocmd FileType h	     setlocal ts=8 sw=8 sts=8 ai tw=0 noexpandtab fdm=manual
		"autocmd FileType c	     setlocal ts=8 sw=8 sts=8 cindent tw=0 cino= ai noexpandtab fdm=manual
		"autocmd FileType cpp	     setlocal ts=8 sw=8 sts=8 cindent tw=0 cino= ai fdm=manual
		autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/.vim/c.vim
	augroup END " }}}

	" Vim {{{
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

    	au FileType vim setlocal foldmethod=marker
    	au FileType help setlocal textwidth=78
    	au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
	augroup END " }}}

	" Markdown {{{
	augroup ft_markdown
    	au!

    	au BufNewFile,BufRead *.m*down setlocal filetype=markdown

    	" Use <localleader>1/2/3 to add headings.
    	au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    	au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    	au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
	augroup END

	" }}}

	" Correct bad filetype detection {{{
  	autocmd BufRead,BufNewFile *.erb set filetype=eruby
  	autocmd BufRead,BufNewFile *.ru set filetype=ruby
  	autocmd BufRead,BufNewFile *.thrift set filetype=thrift
  	autocmd BufRead,BufNewFile *.zsh-theme set filetype=zsh
  	autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
  	autocmd BufRead,BufNewFile *.jquery.js set filetype=javascript syntax=jquery
  	" }}}

	" Python {{{
	augroup ft_python
    	au!

    	" au FileType python setlocal omnifunc=pythoncomplete#Complete
    	au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    	au FileType python compiler nose
    	au FileType man nnoremap <buffer> <cr> :q<cr>
    	
    	" Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    	" override this in a normal way, could you?
    	au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    	" Jesus, Python.  Five characters of punctuation for a damn string?
    	au FileType python inoremap <buffer> <d-'> _(u'')<left><left>
	augroup END " }}}

	" QuickFix {{{
	" quickfix niceties
	augroup ft_quickfix
    	au!
    	au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
	augroup END " }}}

endif " has("autocmd")
" }}}
" Plugin settings --------------------------------------------------------- {{{
" Showmmarks {{{
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr
" }}}
" Netrw {{{
let g:netrw_sort_sequence='[\/]$,\.h$,\.hh$,\.c$,\.cc$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
" }}}

" Indent Guides {{{
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
nnoremap <leader>i :call IndentGuides()<cr>

" }}}

" Smart Tabs {{{
let g:ctab_filetype_maps = 1
" }}}

" Powerline {{{

let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'sjl'
"let g:Powerline_colorscheme = 'molokai'
" }}}

" Syntastic {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0

let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'
" }}}

" DelimitMate {{{
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" Deal with DelimitMate
inoremap <C-Tab> <C-R>=delimitMate#JumpAny("\<C-Tab>")<CR>
" }}}

" Ack {{{
set grepprg=ack
nnoremap <leader>a :Ack
" }}}

" NERDCommenter {{{
" Ctrl-P to Display the file browser tree
nmap <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

let g:NERD_shut_up=1
" }}}

" Supertab {{{
let g:SuperTabNoCompleteAfter = ['\s','\d','^','}',']',')']
" this doesn't work for some reason
let g:SuperTabMappingTabLiteral = '<c-tab>'
let g:SuperTabLongestHighlight = 1
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

let g:SuperTabDefaultCompletionType = "<c-n>"

" prevent expansion of CR, negatively impacts Smart Tabs and delimitmate
let g:SuperTabCrMapping = 0
" }}}

" miniBufExplorer {{{
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=0
let g:miniBufExplMinSize = 2

let g:bufExplorerSortBy = "name"
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ,b to display current buffers list
"let g:miniBufExplVSplit = 25
"let g:miniBufExplorerMoreThanOne = 100
"let g:miniBufExplUseSingleClick = 1
nmap <leader>b :MiniBufExplorer<cr>
autocmd BufRead,BufNew :call UMiniBufExplorer
" }}}

" bufexplorer (do lazy load) {{{
nmap <silent> <leader>be :cal <SID>LazyStart("bufexplorer", "be")<cr>
nmap <silent> <leader>bs :cal <SID>LazyStart("bufexplorer", "bs")<cr>
nmap <silent> <leader>bv :cal <SID>LazyStart("bufexplorer", "bv")<cr>
" }}}

" CtrlP (fuzzy explorer) {{{
let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_by_filename = 0
let g:ctrlp_cache_dir = expand("$HOME/.vim/tmp")
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
" }}}

" FuzzyFinder {{{
" ,f to fast finding files using fuzzy finder.
nmap <leader>F :FufFile **/<CR>
" }}}

" ConqueTerm {{{
let g:Conque_Read_Timeout = 50 " timeout for waiting for command output.
let g:Conque_TERM = 'xterm'

" ,sh to open vimshell window
nmap <leader>sh :ConqueSplit bash<cr>

" ,r to open vimshell window
nmap <leader>r :ConqueSplit
" }}}

" A-CPP (.h <-> .c/cpp switching) {{{
let g:alternateRelativeFiles = 1
let g:alternateNoDefaultAlternate = 1
" }}}

" YankRing {{{
" map ,y to show the yankring
nmap <leader>y :YRShow<cr>

let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = '$HOME/.vim/tmp'
" }}}

" Tlist {{{
" let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
" let Tlist_Sort_Type = "name"
" let Tlist_Show_Menu = 1
" let Tlist_Use_Right_Window = 1
map <leader>T :TlistOpen<cr>
" }}}

" cscope ------------------------------------------------------------- {{{
if has("cscope")
	set cst

	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>

	nmap cfg :cs find g
	nmap cfs :cs find s
endif " }}}

" LaTeX Suite things {{{
"set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

let g:Tex_DefaultTargetFormat="pdf"
"let g:Tex_ViewRule_pdf='xpdf'
let g:Tex_DefaultTargetFormat = 'pdf'

let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -enable-write18 --interaction=nonstopmode $*'

let g:Tex_ViewRule_dvi = 'texniscope'
let g:Tex_ViewRule_ps = 'Preview'
let g:Tex_ViewRule_pdf = 'Skim'
let Tex_UseMakefile = 0

let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'

let g:Tex_IgnoredWarnings ='
			\"Underfull\n".
			\"Overfull\n".
			\"specifier changed to\n".
			\"You have requested\n".
			\"Missing number, treated as zero.\n".
			\"There were undefined references\n".
			\"Citation %.%# undefined\n".
			\"\oval, \circle, or \line size unavailable\n"'

let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
" }}}

" VCS {{{
let VCSCommandEnableBufferSetup=1
" }}}

" Threesome {{{
let g:threesome_initial_mode = "grid"

let g:threesome_initial_layout_grid = 1
let g:threesome_initial_layout_loupe = 0
let g:threesome_initial_layout_compare = 0
let g:threesome_initial_layout_path = 0

let g:threesome_initial_diff_grid = 1
let g:threesome_initial_diff_loupe = 0
let g:threesome_initial_diff_compare = 0
let g:threesome_initial_diff_path = 0

let g:threesome_initial_scrollbind_grid = 0
let g:threesome_initial_scrollbind_loupe = 0
let g:threesome_initial_scrollbind_compare = 0
let g:threesome_initial_scrollbind_path = 0

let g:threesome_wrap = "nowrap"

" }}}

" Fugitive {{{

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" "Hub"
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>

" }}}
" Function for lazy loading ------------------------------------- {{{
" Should be modified for all possible lazy plugins
" by adding correct mappings
func! s:LazyStart(plugin, mapping)
    let lazy_dir = expand('~/.vim/lazy/')
    let rtp_dir = lazy_dir.a:plugin
    if match(split(&rtp,','),rtp_dir)<0
        execute 'se rtp+='.rtp_dir
    endif
    let plug_dir = rtp_dir.'/plugin/'

    if a:plugin == 'bufexplorer'
        nunmap <leader>be
        nunmap <leader>bs
        nunmap <leader>bv
    endif
    execute 'so '.plug_dir.a:plugin.'.vim'
	execute "normal " . g:mapleader . a:mapping
endfunction
" }}}

" }}}

" Allow local configuration to overcome global
if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif

