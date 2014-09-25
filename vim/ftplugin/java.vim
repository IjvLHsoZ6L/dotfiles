if exists('loaded_my_java_plugin')
  finish
endif
let loaded_my_java_plugin = 1

let s:saved_cpopotions = &cpoptions
set cpoptions&vim

"===========================================================

if has('conceal')
  setlocal conceallevel=0
  setlocal concealcursor=
endif

function! s:writecompile()
  write
  let l:out = split(system('myjava ' . expand('%')), "\n")
  let l:nr = winnr()
  let l:outnr = bufwinnr('__output__')
  if l:outnr == -1
    silent! 8 sview __output__
    setlocal buftype=nofile
  else
    execute l:outnr  'wincmd w'
  endif
  silent! % delete
  silent! call append('.', l:out)
  silent! delete
  redraw
  execute l:nr 'wincmd w'
endfunction

nnoremap <silent> <C-@> :call <SID>writecompile()<CR>
inoremap <silent> <C-@> <ESC>:call <SID>writecompile()<CR>

"===========================================================

let &cpoptions = s:saved_cpopotions
unlet s:saved_cpopotions
