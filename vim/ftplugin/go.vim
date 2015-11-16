setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=go\ build
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, :! go run %<CR>

augroup GOLANG
  autocmd!
  autocmd BufWritePost *.go normal ,b
augroup END
