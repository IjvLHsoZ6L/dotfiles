setlocal expandtab
setlocal shiftwidth=2

nnoremap <buffer><silent> ,b :set makeprg=scalac \| make %<CR>
nnoremap <buffer><silent> ,r :! scala %:r<CR>
nmap     <buffer><silent> ,, :! scala %<CR>

augroup Scala
  autocmd!
  autocmd BufWritePost *.scala normal ,b
augroup END
