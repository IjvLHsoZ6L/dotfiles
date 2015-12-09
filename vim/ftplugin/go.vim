setlocal noexpandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal nolist

compiler go
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nnoremap <buffer><silent> ,f :! go fmt %<CR>
nmap     <buffer><silent> ,, :! go run %<CR>

augroup GOLANG
  autocmd!
  autocmd BufWritePost *.go normal ,f,b
augroup END
