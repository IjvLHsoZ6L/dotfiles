" Vim indent file
" Language:    Haskell
" Maintainer:  TOUNAI Shouta <tounai.shouta@gmail.com>
" Last Change: 2015 Jan 11

" Only load this indent file when no other was loaded.
if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal indentexpr=KeepIndent
setlocal indentkeys=!^F,o,O
setlocal autoindent
setlocal nosmartindent
setlocal nolisp

function! KeepIndent()
  return -1
endfunction
