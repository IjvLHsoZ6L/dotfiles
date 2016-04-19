setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=mcs
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! mono %:r.exe<CR>
nmap     <buffer><silent> ,, ,b,r

augroup CSharp
  autocmd!
  autocmd BufWritePost *.cs normal ,b
augroup END
