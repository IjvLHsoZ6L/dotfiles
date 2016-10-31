setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=g++\ -std=c++11 -Wall\ -O2\
nnoremap <buffer><silent> ,b :make -o %:r %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, ,b,r

augroup CPP
  autocmd!
  autocmd BufWritePost *.cpp normal ,b
augroup END
