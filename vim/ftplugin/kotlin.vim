setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=kotlinc
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! kotlin %:rKt<CR>
nmap ,, ,b,r

augroup Kotlin
  autocmd!
  autocmd BufWritePost *.kt normal ,b
augroup END
