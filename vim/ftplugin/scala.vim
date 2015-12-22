setlocal expandtab
setlocal shiftwidth=2

nnoremap <buffer><silent> ,b :! scalac -deprecation -feature -Xlint %<CR>
nnoremap <buffer><silent> ,r :! scala %:r<CR>
nnoremap <buffer><silent> ,i :! scala -i %<CR>
nnoremap <buffer><silent> ,, :! scala %<CR>

augroup Scala
  autocmd!
  autocmd BufWritePost *.scala normal ,b
augroup END
