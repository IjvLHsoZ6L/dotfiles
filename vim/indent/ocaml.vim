" Vim indent file for OCaml

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
 finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal indentexpr=GetOCamlIndent()
setlocal indentkeys+=0=let,0=val,0=method,0=exception,0=external
setlocal indentkeys+=0=type,0=class,0=module,0=open,0=include
setlocal indentkeys+=0=(*
setlocal indentkeys+=0=and,0=in,0=then,0=else,0=with,0=do,0=done,0=end
setlocal indentkeys+=0;;,0),0},0\],0>},0>\],0\|\],0\|
setlocal nolisp
setlocal nosmartindent

" Only define the function once.
if exists('*GetOCamlIndent')
  finish
endif

function! s:matchcount(str, reg)
  let cnt = 0
  let start = 0
  while 1
    let end = matchend(a:str, a:reg, start)
    if end == -1
      return cnt
    endif
    let cnt += 1
    let start = end
  endwhile
endfunction

function! s:prevmatch(lnum, pat, negpat)
  let lnum = a:lnum
  let stack = 1
  while 1
    if lnum == 0
      throw 'prevmatch: pattern not found'
    endif
    let stack -= s:matchcount(getline(lnum), a:pat)
    let stack += s:matchcount(getline(lnum), a:negpat)
    if stack == 0
      return lnum
    endif
    let lnum = prevnonblank(lnum - 1)
  endwhile
endfunction

function! s:is_begining(line)
  if a:line =~ '\v^\s*\(\*'
    return 1
  elseif a:line =~ '\v^\s*<(let|val|method|exception|external)>'
    return 1
  elseif a:line =~ '\v^\s*<(type|class|module|open|include)>'
    return 1
  else
    return 0
endfunction

function! s:is_complete(line)
  if a:line =~ '\v<(if|then|else|match|try|with|while|for|do|begin|object|struct|sig)>\s*$'
    return 0
  elseif a:line =~ "\v'\s*$"
    return 1
  elseif a:line =~ '\v([a-zA-Z0-9_]|\)|\}|\]|")\s*$'
    return 1
  else
    return 0
endfunction

function! GetOCamlIndent()

  let lnum = v:lnum
  let line = getline(lnum)

  let plnum = prevnonblank(lnum - 1)
  let pline = getline(plnum)

  " no previous line
  if plnum == 0
    return 0
  endif

  " previous line ends with 'in | ; | *)'
  if pline =~ '\v(<in>|;|\*\))\s*$'
    return indent(plnum)
  endif

  " current line starts with 'and | in'
  if line =~ '\v^\s*<(and|in)>'
    return indent(s:prevmatch(plnum, '\v<let>', '\v<in>'))
  endif

  " current line starts with 'then'
  if line =~ '\v^\s*<then>'
    return indent(s:prevmatch(plnum, '\v<if>', '\v<then>'))
  endif

  " current line starts with 'else'
  if line =~ '\v^\s*<else>'
    return indent(s:prevmatch(plnum, '\v<if>', '\v<else>'))
  endif

  " current line starts with 'with'
  if line =~ '\v^\s*<with>'
    return indent(s:prevmatch(plnum, '\v<(match|try)>', '\v<with>'))
  endif

  " current line starts with 'do | done'
  if line =~ '\v^\s*<(do|done)>'
    return indent(s:prevmatch(plnum, '\v<for>', '\v<done>'))
  endif

  " current line starts with 'end'
  if line =~ '\v^\s*<end>'
    return indent(s:prevmatch(plnum, '\v<(begin|object|struct|sig)>', '\v<end>'))
  endif

  " current line starts with ';;'
  if line =~ '\v^\s*;;'
    return 0
  endif

  " current line starts with ')'
  if line =~ '\v^\s*\)'
    return indent(s:prevmatch(plnum, '\v\(', '\v\)'))
  endif

  " current line starts with '}'
  if line =~ '\v^\s*\}'
    return indent(s:prevmatch(plnum, '\v\{', '\v\}'))
  endif

  " current line starts with ']'
  if line =~ '\v^\s*\]'
    return indent(s:prevmatch(plnum, '\v\[', '\v\]'))
  endif

  " current line starts with '>}'
  if line =~ '\v^\s*\}'
    return indent(s:prevmatch(plnum, '\v\{\<', '\v\>\}'))
  endif

  " current line starts with '>]'
  if line =~ '\v^\s*\}'
    return indent(s:prevmatch(plnum, '\v\[\<', '\v\>\]'))
  endif

  " current line starts with '|]'
  if line =~ '\v^\s*\}'
    return indent(s:prevmatch(plnum, '\v\[\|', '\v\|\]'))
  endif

  " both current and previous lines start with '|'
  if line =~ '\v^\s*\|' && pline =~ '\v^\s*(\||\))'
    return indent(plnum)
  endif

  " begining of decraration (or comment)
  if s:is_begining(line) && s:is_complete(pline)
    try
      let pmline = s:prevmatch(plnum, '\v<(begin|object|struct|sig)>', '\v<end>')
      return indent(pmline) + &shiftwidth
    catch 'prevmatch: pattern not found'
      return 0
    endtry
  endif

  " no matches
  return indent(plnum) + &shiftwidth

endfunction
