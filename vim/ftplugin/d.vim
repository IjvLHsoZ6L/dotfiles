setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=gdc\ -Wall\ -O2
nnoremap <buffer> <Space>b :make -o %:r %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>

augroup D
  autocmd!
  autocmd BufWritePost *.d make -o %:r % | copen
augroup END
