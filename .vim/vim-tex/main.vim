" support your tex file editing with Vim
" Title: vim-tex
" Author: TOUNAI Shouta
" Version: 0.0

if exists('loaded_vim_tex')
  finish
endif
let loaded_vim_tex = 1

let s:saved_cpopotions = &cpoptions
set cpoptions&vim

"============================================================

function! s:writecompile()
  write
  let l:out = split(system('pdflatex -halt-on-error ' . expand('%')), "\n")
  let l:nr = winnr()
  let l:outnr = bufwinnr('__output__')
  if l:outnr == -1
    silent! sview __output__
    setlocal buftype=nofile
  else
    execute l:outnr 'wincmd w'
    silent! % delete
  endif
  silent! call append('.', l:out) | delete
  if search('\v!|Warning|Overfull|Underfull', 'W') == 0
    normal! G
  endif
  execute l:nr 'wincmd w'
endfunction

nnoremap <silent> <C-@> :call <SID>writecompile()<CR>
inoremap <silent> <C-@> <ESC>:call <SID>writecompile()<CR>

let s:dict = {}
let s:tail = {}

function! s:addcomp(key, val)
  if has_key(s:dict, a:key)
    echomsg 'tryed to define completion' a:key '->' a:val
          \ 'but completion' a:key '->' s:dict[a:key] 'already exists'
  else
    let s:dict[a:key] = a:val
    for l:i in range(1, len(a:key))
      let s:tail[a:key[(-l:i):]] = 1
    endfor
  endif
endfunction

for s:line in readfile(expand('~/.vim/vim-tex/complete.dict'))
  if !empty(s:line) && s:line[0] !=# '%'
    let s:list = split(s:line)
    let s:val = remove(s:list, 0)
    for s:key in s:list
      call s:addcomp(s:key, s:val)
    endfor
  endif
endfor

if filereadable(expand('%'))
  for s:line in readfile(expand('%'))
    let s:match = matchlist(s:line, '\v^\\\a*new\a+\s*\{?(\\\a+).*\%(.+)$')
    if !empty(s:match)
      echomsg 'define completion' s:match[2] '->' s:match[1]
      call s:addcomp(s:match[2], s:match[1])
    endif
  endfor
endif

call writefile(sort(keys(s:dict)), expand('~/.vim/vim-tex/keys.dict'))

function! s:complete()
  let l:col = col('.')
  if col('.') == 1
    return '\'
  endif
  let l:line = getline('.')[:l:col - 2]
  let l:maxlen = 0
  let l:maxkey = ''
  let l:len = 1
  while l:len < l:col
    let l:key = l:line[(-l:len):]
    if has_key(s:tail, l:key)
      if has_key(s:dict, l:key)
        let l:maxlen = l:len
        let l:maxkey = l:key
      endif
    else
      break
    endif
    let l:len += 1
  endwhile
  if l:maxlen == 0
    return '\'
  endif
  let l:val = s:dict[l:maxkey]
  return repeat("\<BS>", l:maxlen) . l:val
endfunction

inoremap <expr> <C-J> <SID>complete()

"============================================================

let &cpoptions = s:saved_cpopotions
unlet s:saved_cpopotions
