setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=mcs
nnoremap <buffer> <Space>b :make %<CR>
nnoremap <buffer> <Space>r :! mono %:r.exe<CR>

augroup C#
  autocmd!
  autocmd BufWritePost *.cs make % | copen
augroup END
