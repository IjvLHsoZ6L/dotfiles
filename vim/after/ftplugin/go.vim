setlocal noexpandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal nolist

compiler go
nnoremap <buffer> <Space>b :make %<CR>
nnoremap <buffer> <Space>f :! go fmt %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>

augroup Go
  autocmd!
  autocmd BufWritePost *.go make % | copen
augroup END
