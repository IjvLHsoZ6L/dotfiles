setlocal expandtab
setlocal shiftwidth=4

compiler javac
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! java %:r<CR>
nmap     <buffer><silent> ,, ,b,r

augroup Java
  autocmd!
  autocmd BufWritePost *.java normal ,b
augroup END
