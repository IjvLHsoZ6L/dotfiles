setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

compiler javac
nnoremap <buffer> <Space>b :make -Xlint %<CR>
nnoremap <buffer> <Space>r :! java %:r<CR>

augroup Java
  autocmd!
  autocmd BufWritePost *.java make -Xlint % | copen
augroup END
