let s:words = [
      \ 'and',
      \ 'as',
      \ 'assert',
      \ 'asr',
      \ 'begin',
      \ 'class',
      \ 'constraint',
      \ 'do',
      \ 'done',
      \ 'downto',
      \ 'else',
      \ 'end',
      \ 'exception',
      \ 'external',
      \ 'false',
      \ 'for',
      \ 'fun',
      \ 'function',
      \ 'functor',
      \ 'if',
      \ 'in',
      \ 'include',
      \ 'inherit',
      \ 'initializer',
      \ 'land',
      \ 'lazy',
      \ 'let',
      \ 'lor',
      \ 'lsl',
      \ 'lsr',
      \ 'lxor',
      \ 'match',
      \ 'method',
      \ 'mod',
      \ 'module',
      \ 'mutable',
      \ 'new',
      \ 'object',
      \ 'of',
      \ 'open',
      \ 'or',
      \ 'private',
      \ 'rec',
      \ 'sig',
      \ 'struct',
      \ 'then',
      \ 'to',
      \ 'true',
      \ 'try',
      \ 'type',
      \ 'val',
      \ 'virtual',
      \ 'when',
      \ 'while',
      \ 'with' ]

for s:mlifile in split(expand('/usr/lib/ocaml/*.mli'))
  for s:line in readfile(s:mlifile)
    let s:ml = matchlist(s:line, '\v^\s*(val|type|module|external)\s+(\w+)\s+')
    if !empty(s:ml)
      call add(s:words, s:ml[2])
    endif
  endfor
endfor

call sort(s:words)

function! s:unique(lst)
  let orig = sort(a:lst)
  let uniq = []
  let prev = ''
  for x in orig
    if x != prev
      call add(uniq, x)
      let prev = x
    endif
  endfor
  return uniq
endfunction

call writefile(s:unique(s:words), 'ocaml.dict')
