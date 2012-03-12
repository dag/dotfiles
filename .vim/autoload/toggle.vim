function! toggle#colorcolumn() " {{{
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction " }}}


function! toggle#relativenumber() " {{{
  if &relativenumber
    setlocal number
  else
    setlocal relativenumber
  endif
endfunction " }}}
