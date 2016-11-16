setlocal expandtab
setlocal shiftwidth=2

nnoremap <buffer><silent> ,b :! nim compile %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, ,b,r

augroup Nim
  autocmd!
  autocmd BufWritePost *.nim make
augroup END
