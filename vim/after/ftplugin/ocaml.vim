setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=4
setlocal shiftwidth=2

setlocal makeprg=ocamlopt
nnoremap <buffer> <Space>b :make -o %:r %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>
nnoremap <buffer> <Space>i :! ocaml %<CR>

augroup OCaml
  autocmd!
  autocmd BufWritePost *.ml make -o %:r % | copen
augroup END
