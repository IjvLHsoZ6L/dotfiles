let s:words = []

for s:mlifile in split(expand('/usr/lib/ocaml/*.mli'))
  for s:line in readfile(s:mlifile)
    let s:ml = matchlist(s:line, '\v^\s*(val|type|module|external)\s+([a-zA-Z0-9_]+)\s+')
    if !empty(s:ml)
      call add(s:words, s:ml[2])
    endif
  endfor
endfor

call sort(s:words)

call writefile(s:words, 'ocaml.dict')
