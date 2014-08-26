let s:output = []

let s:output += [
      \ 'snippet documentclass',
      \ 'alias \documentclass template',
      \ 'abbr [classfile]',
      \ '  \documentclass{${1:classfile}}',
      \ '',
      \ '  \begin{document}',
      \ '',
      \ '  \end{document}',
      \ '',
      \ ]

for s:cf in [
      \ 'article',
      \ 'jarticle',
      \ 'jsarticle',
      \ 'amsart',
      \ ]
  let s:output += [
        \ 'snippet ' . s:cf,
        \ 'abbr [classfile] ' . s:cf,
        \ '  \documentclass{' . s:cf . '}',
        \ '',
        \ '  \begin{document}',
        \ '',
        \ '  ${0:TARGET}',
        \ '',
        \ '  \end{document}',
        \ '',
        \ ]
endfor

let s:output += [
      \ 'snippet begin',
      \ 'alias \begin{} environment',
      \ 'abbr [env]',
      \ '  \begin{${1:environment}}',
      \ '    ${0:TARGET}',
      \ '  \end{$1}',
      \ '',
      \ ]

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
      \ 'multline',
      \ 'multline*',
      \ 'split',
      \ 'cases',
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
  let s:output += [
        \ 'snippet ' . s:env,
        \ 'alias \begin{' . s:env . '} \' . s:env,
        \ 'abbr [env] ' . s:env,
        \ '  \begin{' . s:env . '}',
        \ '    ${0:TARGET}',
        \ '  \end{' . s:env . '}',
        \ '',
        \ ]
endfor

for s:env in [
      \ 'itemize',
      \ 'enumerate',
      \ 'description',
      \ 'thebibliography',
      \ ]
  let s:output += [
        \ 'snippet ' . s:env,
        \ 'alias \begin{' . s:env . '} \' . s:env,
        \ 'abbr [env] ' . s:env,
        \ '  \begin{' . s:env . '}',
        \ '    \item ${0:TARGET}',
        \ '  \end{' . s:env . '}',
        \ '',
        \ ]
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
  let s:output += [
        \ 'snippet ' . s:sec,
        \ 'alias \' . s:sec,
        \ 'abbr [sec] ' . s:sec,
        \ '  \'. s:sec . '{${1:index}}',
        \ '  ${0:TARGET}',
        \ '',
        \ ]
endfor

if writefile(s:output, expand('~/.vim/snippets/tex.snip')) == -1
  echo 'failed'
else
  echo 'succeeded'
endif
