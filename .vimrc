" Bundles {{{

" Initialize {{{

set nocompatible
filetype off
let mapleader = ','
let g:vundle_default_git_proto = 'git'

" }}}

" Vundle {{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" }}}

" Colorschemes {{{

Bundle 'aerosol/vim-compot'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Cleanroom'
Bundle 'djjcast/mirodark'
Bundle 'jnurmine/Zenburn'
Bundle 'neutron.vim'
Bundle 'noahfrederick/Hemisu'
Bundle 'scottymoon/vim-twilight'
Bundle 'vydark'
Bundle 'vylight'

" }}}

" Features {{{

Bundle 'AutoTag'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'lodgeit.vim'
Bundle 'renamer.vim'

Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'

Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rhubarb'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" }}}

" Filetypes {{{

Bundle 'hallison/vim-markdown'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'pbrisbin/html-template-syntax'

Bundle 'dag/vim2hs'

" }}}

" }}} Bundles

" Preferences {{{

" IDE {{{

filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu
runtime macros/matchit.vim
let g:SuperTabDefaultCompletionType = "context"

" }}}

" Mappings {{{

function! g:ToggleColorColumn() " {{{
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction " }}}

function! g:ToggleRelativeNumber() " {{{
  if &relativenumber
    setlocal number
  else
    setlocal relativenumber
  endif
endfunction " }}}

nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>
nnoremap <silent> <leader>nu :call g:ToggleRelativeNumber()<CR>
nnoremap <silent> <leader>st :SyntasticToggleMode<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>li :setlocal wrap! list!<CR>

inoremap <C-A> <C-O>^
inoremap <C-E> <C-O>$
cnoremap <C-A> <Home>
cnoremap <C-X><C-A> <C-A>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
inoremap <C-k> <C-O>D
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

nnoremap / /\v
vnoremap / /\v

nnoremap j gj
nnoremap k gk

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <silent> <leader>l :nohlsearch<cr>

" nnoremap <leader>b :FufBuffer<cr>
" nnoremap <leader>d :FufDir<cr>
" nnoremap <leader>f :FufCoverageFile<cr>
" nnoremap <leader>t :FufTag<cr>
" nnoremap <leader>q :FufQuickfix<cr>

nnoremap <silent> sj     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> sL     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sy     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>

nnoremap <leader>gs :Gstatus<cr>

nnoremap <leader>a :Tabularize<space>
vnoremap <leader>a :Tabularize<space>

nnoremap <leader>e :split $MYVIMRC<cr>

call togglebg#map("<F5>")

" }}}

" Settings {{{

" Use two spaces for default indentation
set expandtab shiftwidth=2 softtabstop=2

let &showbreak = '➥ '
set autoindent
set autowriteall
set confirm
set fillchars=fold:·
set foldcolumn=1
set hidden
set keywordprg=:help
set linebreak
set listchars=eol:¶,tab:»—,trail:!
set modeline
set mouse=a
set numberwidth=5
set path+=src
set ruler
set scrolloff=3
set showcmd
set textwidth=75
set undofile
set wildmenu
set wildignore=.*.*~,.*.sw?

set ignorecase smartcase
set gdefault

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

match Error /\s\+$/
match SpellBad /\t/

let g:ctrlp_custom_ignore            = '\v%(\.git|_darcs|cabal-dev|dist)$'
let g:ctrlp_working_path_mode        = 2
let g:syntastic_check_on_open        = 1
let g:UltiSnipsDontReverseSearchPath = 1

" }}}

" Workarounds {{{

augroup Workarounds
  auto!
  auto ColorScheme * filetype detect
  auto ColorScheme * highlight! link FoldColumn LineNr
  auto ColorScheme * highlight! link SignColumn LineNr
  auto ColorScheme * highlight! link Conceal Operator
  auto ColorScheme * highlight! link NonText LineNr
augroup END

" }}}

" }}} Preferences

" Environments {{{

" GVim {{{

set guioptions=aeg guiheadroom=0
let &guifont = 'Ubuntu Mono 11'

function! s:InitGUI()
  set columns=90 lines=45
  set relativenumber
  set incsearch showmatch hlsearch

  set background=light
  colorscheme vylight
  highlight! link FoldColumn LineNr
  highlight! link SignColumn LineNr
  highlight! link NonText LineNr

  augroup GUI
    auto!

    auto FocusLost * silent! wall

    auto BufWinEnter,WinEnter,FocusGained * setlocal relativenumber
    auto WinLeave,FocusLost               * setlocal number
  augroup END
endfunction

augroup InitGUI
  auto!
  auto GUIEnter * call s:InitGUI()
augroup END

" }}}

" Terminal {{{

if !has('gui_running')
  let g:solarized_termcolors = 16
  let g:solarized_termtrans = 1
  set background=light
  colorscheme solarized
endif

" }}}

" }}} Environments

" Filetypes {{{

" Vimscript {{{

let g:vim_indent_cont = &shiftwidth

function! g:VimFoldText() " {{{
  return matchstr(foldtext(), '.*\d lines\?: \zs.*')
endfunction " }}}

augroup Vim
  auto!
  auto FileType vim setlocal foldmethod=marker foldtext=g:VimFoldText()
  auto FileType vim setlocal expandtab shiftwidth=2
  auto BufWritePost $MYVIMRC source $MYVIMRC
  auto BufWritePost $MYVIMRC if has('gui_running')
  auto BufWritePost $MYVIMRC   call s:InitGUI()
  auto BufWritePost $MYVIMRC endif
augroup END

" }}}

" Python {{{

let python_no_builtin_highlight = 1
let python_space_error_highlight = 1

augroup Python
  auto!
  auto FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END

" }}}

" Haskell {{{

let g:haddock_browser = 'xdg-open'
let g:hpaste_author = 'donri'

augroup Haskell
  auto!
  auto FileType haskell nnoremap <buffer> <silent> <leader>hi
                          \ :Tabularize haskell_imports<CR>
  auto FileType haskell vnoremap <buffer> <silent> <leader>hi
                          \ :Tabularize haskell_imports<CR>
augroup END

" }}}

" Make {{{

augroup Make
  auto!
  auto FileType make match Normal /^\t+/
augroup END

" }}}

" UltiSnips {{{

augroup UltiSnips
  auto!
  auto BufNewFile,BufRead *.snippets setfiletype snippets
  auto FileType snippets setlocal noexpandtab shiftwidth& softtabstop&
  auto FileType snippets match Normal /^\t+/
augroup END

" }}}

" }}} Filetypes
