setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=nim
nnoremap <buffer> <Space>b :make compile %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>

augroup Nim
  autocmd!
  autocmd BufWritePost *.nim make compile % | copen
augroup END
