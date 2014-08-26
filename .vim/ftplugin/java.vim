nnoremap <silent> <C-@> :call <SID>writecompile()<CR>
inoremap <silent> <C-@> <ESC>:call <SID>writecompile()<CR>
function! s:writecompile()
  write
  let l:out = split(system('myjava ' . expand('%')), "\n")
  let l:nr = winnr()
  if bufexists('__output__')
    bdelete __output__
  endif
  silent! belowright 8 sview __output__
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal undolevels=-1
  silent! call append(0, l:out)
  execute l:nr 'wincmd w'
endfunction
