setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=g++\ -O2\ -std=c++11
nnoremap <buffer><silent> ,b :make % -o %:r.out<CR>
nnoremap <buffer><silent> ,r :! ./%:r.out<CR>
nmap     <buffer><silent> ,, ,b,r

augroup C++
  autocmd!
  autocmd BufWritePost *.cpp normal ,b
augroup END
