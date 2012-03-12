function! g:VimFoldText() " {{{
  return matchstr(foldtext(), '.*\d lines\?: \zs.*')
endfunction " }}}

setlocal foldmethod=marker foldtext=g:VimFoldText()
setlocal expandtab shiftwidth=2
