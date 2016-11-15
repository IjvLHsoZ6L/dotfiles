setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=gdc\ -Wall\ -O2
nnoremap <buffer><silent> ,b :make -o %:r %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, ,b,r

augroup DLANG
  autocmd!
  autocmd BufWritePost *.d normal ,b
augroup END
