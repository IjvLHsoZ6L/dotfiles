setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=g++\ -g\ -Wall\ -O2\ -std=c++11
nnoremap <buffer><silent> ,b :make % -o %:r<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, ,b,r

augroup CPP
  autocmd!
  autocmd BufWritePost *.cpp normal ,b
augroup END