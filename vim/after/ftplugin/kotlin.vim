setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=kotlinc
nnoremap <buffer> <Space>b :make %<CR>
nnoremap <buffer> <Space>r :! kotlin %:rKt<CR>

augroup Kotlin
  autocmd!
  autocmd BufWritePost *.kt make % | copen
augroup END
