setlocal expandtab
setlocal shiftwidth=2

setlocal makeprg=coffee\ -c
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,, ,b

augroup CoffeeScript
  autocmd!
  autocmd BufWritePost *.coffee normal ,b
augroup END
