" GUI {{{

let &guifont = 'Ubuntu Mono 11'
set guioptions=aeg
set guiheadroom=0

" }}} GUI


" Colorscheme {{{

set background=light
colorscheme vylight

" }}} Colorscheme


" Settings {{{

set relativenumber
set foldcolumn=1

" }}} Settings


" Focus {{{

augroup Focus
  auto!
  auto FocusLost                        * silent! wall
  auto BufWinEnter,WinEnter,FocusGained * setlocal relativenumber
  auto WinLeave,FocusLost               * setlocal number
augroup END

" }}} Focus


" Reloading {{{

if !exists('s:first_start')
  set columns=90 lines=45
  let s:first_start = 1
endif

augroup GVIMRC
  auto!
  auto BufWritePost $MYGVIMRC nested source $MYGVIMRC
augroup END

" }}} Reloading
