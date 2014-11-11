" Vim indent file
" Language:     OCaml

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
 finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal indentexpr=GetOCamlIndent()
setlocal indentkeys&
setlocal nolisp
setlocal nosmartindent

function! GetOCamlIndent()
  return -1
endfunction
