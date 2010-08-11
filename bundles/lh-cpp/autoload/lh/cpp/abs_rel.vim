"=============================================================================
" $Id: abs_rel.vim 216 2010-05-20 01:22:23Z luc.hermitte $
" File:		autoload/lh/cpp/abs_rel.vim                       {{{1
" Author:	Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
" 		<URL:http://code.google.com/p/lh-vim/>
" Version:	1.1.0
" Created:	12th May 2009
" Last Update:	$Date: 2010-05-20 03:22:23 +0200 (Thu, 20 May 2010) $
"------------------------------------------------------------------------
" Description:	
"  Generative functions for the cpp/abs-rel.template file
" 
"------------------------------------------------------------------------
" Installation:	«install details»
" History:	«history»
" TODO:		«missing features»
" }}}1
"=============================================================================

let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------

" ## Functions {{{1
" # Debug {{{2
function! lh#cpp#abs_rel#verbose(level)
  let s:verbose = a:level
endfunction

function! s:Verbose(expr)
  if exists('s:verbose') && s:verbose
    echomsg a:expr
  endif
endfunction

function! lh#cpp#abs_rel#debug(expr)
  return eval(a:expr)
endfunction

"------------------------------------------------------------------------
function! lh#cpp#abs_rel#canonicalortodoxform(clsname, required)
  if !a:required | return "" | endif
  let text = Marker_Txt("sorry not implemented yet>") . ";\n"
  return text
endfunction
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
