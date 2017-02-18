setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

setlocal makeprg=coffee\ -c
nnoremap <buffer><silent> <Space>b :make %<CR>

augroup CoffeeScript
  autocmd!
  autocmd BufWritePost *.coffee make % | copen
augroup END
