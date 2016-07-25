setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=rustc
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, ,b,r

augroup Rust
  autocmd!
  autocmd BufWritePost *.rs normal ,b
augroup END
