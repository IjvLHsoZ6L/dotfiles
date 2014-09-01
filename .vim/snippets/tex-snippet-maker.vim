let s:output = []

function! s:addsnip(name, abbr, alias, options, body)
  call add(s:output, 'snippet ' . a:name)
  call add(s:output, 'abbr ' . a:abbr)
  if !empty(a:alias)
    call add(s:output, 'alias ' . a:alias)
  endif
  if !empty(a:options)
    call add(s:output, 'options ' . a:options)
  endif
  for l:line in split(a:body, '@')
    if empty(l:line)
      call add(s:output, '')
    else
      call add(s:output, '  ' . l:line)
    endif
  endfor
  call add(s:output, '')
endfunction

call s:addsnip('documentclass', '\documentclass', '\documentclass', 'head',
      \ '\documentclass{${1}}@@\begin{document}@@${0}@@\end{document}')

for s:cf in [
      \ 'article',
      \ 'jarticle',
      \ 'jsarticle',
      \ 'amsart',
      \ ]
  call s:addsnip(s:cf, printf('\documentclass{%s}', s:cf), '', 'head',
        \ printf('\documentclass{%s}@@\begin{document}@@${0}@@\end{document}', s:cf))
endfor

for s:sec in [
      \ 'part',
      \ 'chapter',
      \ 'section',
      \ 'subsection',
      \ 'subsubsection',
      \ 'paragraph',
      \ 'subparagraph',
      \ ]
  call s:addsnip(s:sec, printf('\%s{...}', s:sec), printf('\%s', s:sec), 'head',
        \ printf('\%s{${1}}@${0}', s:sec))
endfor

call s:addsnip('begin', '\begin{} ... \end{}', '\begin', 'head',
      \ '\begin{${1}}@  ${2}@\end{$1}${0}')

for s:env in [
      \ 'center',
      \ 'flushleft',
      \ 'flushright',
      \ 'quote',
      \ 'quotation',
      \ 'abstract',
      \ 'proof',
      \ 'theorem',
      \ 'definition',
      \ 'proposition',
      \ 'lemma',
      \ 'corollary',
      \ 'remark',
      \ 'example',
      \ 'equation',
      \ 'equation*',
      \ 'gather',
      \ 'gather*',
      \ 'align',
      \ 'align*',
      \ 'multline',
      \ 'multline*',
      \ 'split',
      \ 'cases',
      \ 'cases*',
      \ 'dcases',
      \ 'dcases*',
      \ 'matrix',
      \ 'pmatrix',
      \ 'bmatrix',
      \ 'Bmatrix',
      \ 'vmatrix',
      \ 'Vmatrix',
      \ 'smallmatrix',
      \ 'CD',
      \ 'xy',
      \ ]
  call s:addsnip(s:env, printf('\begin{%s}', s:env), printf('\begin{%s}', s:env), 'head',
        \ printf('\begin{%s}@  ${1}@\end{%s}${0}', s:env, s:env))
endfor

for [s:env, s:item] in [
      \ ['itemize', '\item'],
      \ ['enumerate', '\item'],
      \ ['description', '\item'],
      \ ['thebibliography', '\bibitem'],
      \ ]
  call s:addsnip(s:env, printf('\begin{%s}', s:env), printf('\begin{%s}', s:env), 'head',
        \ printf('\begin{%s}@  %s ${1}@\end{%s}${0}', s:env, s:item, s:env))
endfor

call s:addsnip('eq', '\[ ... \]', '\[', 'head',
      \ '\[@  ${1}@\]${0}')

for [s:name, s:left, s:right] in [
      \ ['paren', '(', ')'],
      \ ['brack', '[', ']'],
      \ ['brace', '\{', '\}'],
      \ ['vert', '\lvert', '\rvert'],
      \ ['Vert', '\lVert', '\rVert'],
      \ ['floor', '\lfloor', '\rfloor'],
      \ ['ceil', '\lceil', '\rceil'],
      \ ['angle', '\langle', '\rangle'],
      \ ]
  call s:addsnip(s:name, printf('%s ... %s', s:left, s:right), s:left, '',
        \ printf('%s ${1} %s${0}', s:left, s:right))
  call s:addsnip(
        \ printf('auto%s', s:name),
        \ printf('\left%s ... \right%s', s:left, s:right),
        \ printf('\left%s', s:left), '',
        \ printf('\left%s ${1} \right%s${0}', s:left, s:right))
  call s:addsnip(
        \ printf('auto%s3', s:name),
        \ printf('\left%s ... \middle| ... \right%s', s:left, s:right),
        \ printf('\left%s3', s:left), '',
        \ printf('\left%s\, ${1} \,\%middle|\, ${2} \,\right%s${0}',
        \ s:left, s:right))
  for s:size in ['big', 'Big', 'bigg', 'Bigg']
    call s:addsnip(
          \ printf('%s%s', s:size, s:name),
          \ printf('\%sl%s ... \%sr%s', s:size, s:left, s:size, s:right),
          \ printf('\%sl%s', s:size, s:left), '',
          \ printf('\%sl%s ${1} \%sr%s${0}', s:size, s:left, s:size, s:right))
    call s:addsnip(
          \ printf('%s%s3', s:size, s:name),
          \ printf('\%sl%s ... \%sm| ... \%sr%s', s:size, s:left, s:size, s:size, s:right),
          \ printf('\%sl%s3', s:size, s:left), '',
          \ printf('\%sl%s\, ${1} \,\%sm|\, ${2} \,\%sr%s${0}',
          \ s:size, s:left, s:size, s:size, s:right))
  endfor
endfor

if writefile(s:output, expand('~/.vim/snippets/tex.snip')) == -1
  echo 'failed'
else
  echo 'succeeded'
endif
