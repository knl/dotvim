set nocompatible

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#helptags()
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

syntax on
filetype plugin indent on

"set completeopt=menuone,preview,longest
set completeopt=menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Omni completion settings
set ofu=syntaxcomplete#Complete

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0

"colorscheme vividchalk
colorscheme zenburn
set background=dark

let bash_is_sh=1
set cinoptions=:0,(s,u0,U1,g0,t0

set modelines=5
set tags=tags;/

" default:
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P
" highlihgt the file name
hi User1 term=bold,reverse cterm=bold ctermfg=4 ctermbg=2 gui=bold guifg=Blue guibg=#44aa00
"set statusline=%<%1*%f%*\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P
if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif

let VCSCommandEnableBufferSetup=1
set statusline=%<%f\ %{VCSCommandGetStatusLine()}\ %{SyntasticStatuslineFlag()}%h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
"
"set cuc
"set cul

"set number

set encoding=utf-8
set textwidth=0         " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS
set incsearch           " Incremental search
set gdefault			" Turn on global replace (//g)
"set autowriteall        " Automatically save before commands like :next and :make
set hlsearch            " Highlight search match
set hidden              " enable multiple modified buffers
set nobackup            " do not write backup files
set autoread		" Set to auto read when a file is changed from the outside
"set noswapfile          " do not write .swp files
set foldcolumn=0        " columns for folding
set foldmethod=indent
set foldlevel=9
set history=1000
set wildmenu
set ruler
set visualbell
set autoread            " automatically read feil that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start
set guioptions-=T       " disable toolbar"

set autoindent		" always set autoindenting on
set smartindent     " smart indenting
set copyindent		" copy indent from previous line on autoindent
set preserveindent  " preserve indentination

set backspace=indent,eol,start		" allow backspacing over everything in insert mode

" tabs and spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " expand tabs
set shiftround		" use a multiple of sw for <

"set formatoptions=qrn1

if has("macunix") 
	"let s:name = system("uname")
	"if s:name == "Darwin"
		set relativenumber
		set ttyfast
	"endif
endif

" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

set shell=/bin/zsh

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

set backupdir=$HOME/.vim/backup,.
set directory=$HOME/.vim/tmp,.

if has("mouse")
  set mouse=a
endif

" enable showmmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" Make
:command -nargs=* Make make <args> | cwindow 3

"set completeopt=menuone,preview,longest
set completeopt=menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Omni completion settings
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1
" completing Rails hangs a lot
"let g:rubycomplete_rails = 1

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1


let mapleader = ","
let g:mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

"Switch to current dir
map <leader>cd :cd %:p:h<cr>

" highlight trailing whitespace  
set listchars=tab:▷⋅,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

" Fix matching
nnoremap / /\v
vnoremap / /\v
" remove highlight on matched
nnoremap <leader><space> :silent noh<cr>

" extended '%' mapping for if/then/else/end etc
runtime plugin/matchit.vim

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Ack
nnoremap <leader>a :Ack

" Select pasted text
nnoremap <leader>v V`]

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" NERDCommenter {
" Ctrl-P to Display the file browser tree
nmap <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

let g:NERD_shut_up=1
" }

" miniBufExplorer {
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1
let g:miniBufExplMinSize = 2

let g:bufExplorerSortBy = "name"
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

nmap <leader>S :SessionList<CR>
nmap <leader>SS :SessionSave<CR>
nmap <leader>SA :SessionSaveAs<CR>

" ,b to display current buffers list
"let g:miniBufExplVSplit = 25
"let g:miniBufExplorerMoreThanOne = 100
"let g:miniBufExplUseSingleClick = 1
nmap <Leader>b :MiniBufExplorer<cr>
" }

" ConqueTerm {
let g:Conque_Read_Timeout = 50 " timeout for waiting for command output.
let g:Conque_TERM = 'xterm'

" ,sh to open vimshell window
nmap <Leader>sh :ConqueSplit bash<cr>

" ,r to open vimshell window
nmap <Leader>r :ConqueSplit 
" }

" YankRing {
" map ,y to show the yankring
nmap <leader>y :YRShow<cr>

let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = '$HOME/.vim/tmp'
" }

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

" ,f to fast finding files using fuzzy finder.
nmap <leader>f :FufFile **/<CR>


" Only do this part when compiled with support for autocommands.
if has("autocmd")

	autocmd BufRead,BufNew :call UMiniBufExplorer
	autocmd Filetype tex setlocal nofoldenable

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("'\"") <= line("$") |
					\   exe "normal g`\"" |
					\ endif

	augroup END

	" for git
	autocmd FileType gitcommit DiffGitCached | wincmd R | wincmd p

	" idents for c/c++ programs
	augroup cprograms
		autocmd FileType objc	     setlocal ts=4 sw=4 sts=4 ai  fdm=manual
		autocmd FileType h	     setlocal ts=4 sw=4 sts=4 ai tw=0 fdm=manual
		autocmd FileType c	     setlocal ts=4 sw=4 sts=4 cindent tw=0 cino= ai fdm=manual
		autocmd FileType cpp   	     setlocal ts=4 sw=4 sts=4 cindent tw=0 cino= ai fdm=manual
	augroup END


endif " has("autocmd")

" let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
" let Tlist_Sort_Type = "name"
" let Tlist_Show_Menu = 1
" let Tlist_Use_Right_Window = 1
map <leader>T :TlistOpen<cr>

let g:showfuncctagsbin = "/opt/local/bin/ctags"

if has("cscope")
	set csprg=/opt/local/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	"if filereadable("cscope.out")
	"cs add cscope.out
	" else add database pointed to by environment
	"elseif $CSCOPE_DB != ""
	"cs add $CSCOPE_DB
	"endif
	set csverb
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap cfg :cs find g
	nmap cfs :cs find s

endif

" LaTeX Suite things {
"set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

let g:Tex_DefaultTargetFormat="pdf"
"let g:Tex_ViewRule_pdf='xpdf'
let g:Tex_DefaultTargetFormat = 'pdf'

let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex $*'

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
" }

" ShowFuncName
fun! ShowFuncName()
	let lnum = line(".")
	let col = col(".")
	echohl ModeMsg
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
	echohl None
	call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map ,f :call ShowFuncName() <CR>

let g:netrw_sort_sequence='[\/]$,\.h$,\.hh$,\.c$,\.cc$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'

" Whitespace problems
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

" do not use arrow keys
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

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

cunmap <Left>
cunmap <Right>

" Deal with DelimitMate
inoremap <C-Tab> <C-R>=delimitMate#JumpAny("\<C-Tab>")<CR>

" It clears the search buffer
" nmap <silent> <leader>/ :let @/=""<CR>

nnoremap ; :
