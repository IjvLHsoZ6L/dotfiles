if has('conceal')
  setlocal conceallevel=2
  setlocal concealcursor=i
endif

function! s:writecompile()
  write
  let l:out = split(system('myjava ' . expand('%')), "\n")
  let l:nr = winnr()
  let l:outnr = bufwinnr('__output__')
  if l:outnr == -1
    silent! sview __output__
    setlocal buftype=nofile
  else
    execute l:outnr  'wincmd w'
  endif
  silent! % delete
  silent! call append('.', l:out)
  silent! delete
  execute l:nr 'wincmd w'
endfunction

nnoremap <silent> <C-@> :call <SID>writecompile()<CR>
inoremap <silent> <C-@> <ESC>:call <SID>writecompile()<CR>
