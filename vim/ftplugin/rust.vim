setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=rustc
nnoremap <buffer> <Space>b :make %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>

augroup Rust
  autocmd!
  autocmd BufWritePost *.rs make % | copen
augroup END
