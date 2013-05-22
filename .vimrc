" Vundle {{{

set nocompatible
filetype off
let mapleader = ' '
let maplocalleader = ','
let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
runtime vundle.vim

" }}} Vundle


" Terminal {{{

if !has('gui_running')
  let g:solarized_termcolors = 16
  let g:solarized_termtrans = 1
  set t_Co=16
  set background=dark
  colorscheme solarized
endif

" }}} Terminal


" IDE {{{

filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu
runtime macros/matchit.vim
let g:SuperTabDefaultCompletionType = "context"

sign define SyntasticError
  \ text=»» texthl=Error
  \ icon=/home/dag/.icons/Faenza/status/scalable/dialog-error.svg

sign define SyntasticWarning
  \ text=»» texthl=Todo
  \ icon=/home/dag/.icons/Faenza/status/scalable/dialog-warning.svg

" }}}


" Mappings {{{

" Toggles {{{

nnoremap <silent> <leader>tcc :call toggle#colorcolumn()<CR>
nnoremap <silent> <leader>tsp :setlocal spell!<CR>
nnoremap <silent> <leader>tcu :setlocal cursorline! cursorcolumn!<CR>
nnoremap <silent> <leader>tnu :call toggle#relativenumber()<CR>
nnoremap <silent> <leader>tsy :SyntasticToggleMode<CR>
nnoremap <silent> <F9> :NERDTreeToggle<CR>
nnoremap <silent> <leader>tli :setlocal wrap! list!<CR>

" }}} Toggles

" Search {{{

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" nnoremap / /\v
" vnoremap / /\v

nnoremap <silent> <leader>/ :nohlsearch<cr>

" }}} Search

" Pasting {{{

nnoremap <silent> <F8> :set paste<cr>"+p:set nopaste<cr>
inoremap <silent> <F8> <esc>:set paste<cr>"+p:set nopaste<cr>a

" }}} Pasting

" Cmdline/Insert Mode {{{

inoremap <C-A> <C-O>^
inoremap <C-E> <C-O>$
cnoremap <C-A> <Home>
cnoremap <C-X><C-A> <C-A>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
inoremap <C-k> <C-O>D
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" }}} Cmdline/Insert Mode

" Window Navigation {{{

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader><leader> <c-^>

" }}} Window Navigation

" FuzzyFinder {{{

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

" }}} FuzzyFinder

" Configuring Vim {{{

nnoremap <F6> :vsplit $MYVIMRC<CR>
nnoremap <C-F6> :vsplit $MYGVIMRC<CR>
nnoremap <S-F6> :vsplit ~/.vim/vundle.vim<cr>
nnoremap <C-S-F6> :NERDTreeToggle ~/.vim<cr>

" }}} Configuring Vim

" Fold Navigation {{{

nnoremap <m-h> zc
nnoremap <m-j> zj
nnoremap <m-k> zk
nnoremap <m-l> zo

" }}} Fold Navigation

" Various {{{

nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap ; :

vnoremap <c-right> :s/^\s*\zs/ /<cr>:nohl<cr>gv
vnoremap <c-left> :s/^\s*\zs\s//<cr>:nohl<cr>gv

nnoremap <leader>gs :Gstatus<cr>

nnoremap <leader>a :Tabularize<space>
vnoremap <leader>a :Tabularize<space>

nnoremap <silent> <F5> :write \| make \| cwindow<cr>

nnoremap gt <C-]>

nmap <leader>s vii:sort i<cr>
vnoremap <leader>s :sort i<cr>

function! AlignByCurrentSymbol() " {{{
  execute 'Tabularize /\V\s\zs' . escape(expand('<cWORD>'), '\') . '\ze\s/'
endfunction " }}}

nnoremap <silent> <leader>c :call AlignByCurrentSymbol()<cr>

" }}} Various

" }}} Mappings


" Settings {{{

" Indentation {{{

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

" }}} Indentation

" Wrapping {{{

let &showbreak = '➥ '
set linebreak
set nowrap
set textwidth=75

" }}} Wrapping

" Behavior {{{

set autowriteall
set confirm
set hidden
set keywordprg=:help
set maxmempattern=2000000
set modeline
set mouse=a
set path+=bin
set path+=src
set path+=test
set undofile
set virtualedit=block

" }}} Behavior

" Interface {{{

set fillchars=
set laststatus=2
set listchars=eol:¶,tab:»—,trail:!
set ruler
set scrolloff=3
set shortmess+=I
set showcmd

let g:changelog_spacing_errors = 0

" }}} Interface

" Completion {{{

set wildignore=.*.*~,.*.sw?,.swp,*.hi,*.o
set wildmenu
set wildmode=list:longest,list:full

" }}} Completion

" Search {{{

set gdefault
set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase

" }}} Search

" Plugins {{{

let g:ackprg                          = 'ag --nogroup --nocolor --column'
let g:ctrlp_custom_ignore             = '\v%(\.git|_darcs|cabal-dev|dist|state|tags)$'
let g:ctrlp_working_path_mode         = 0
let g:cumino_default_terminal         = '/usr/bin/gnome-terminal'
let g:neocomplcache_enable_at_startup = 1
let g:Powerline_symbols               = 'fancy'
let g:syntastic_check_on_open         = 1
let g:syntastic_enable_highlighting   = 0
let g:syntastic_stl_format            = '%E{ E:%fe }'
let g:UltiSnipsDontReverseSearchPath  = 1
let NERDTreeIgnore                    = [g:ctrlp_custom_ignore]

let &statusline = join([
  \ '%<%f %h%m%r',
  \ '[%{pathshorten(substitute($PWD, "^" . $HOME, "~", ""))}]',
  \ '%{fugitive#statusline()}',
  \ '%=%-14.(%l,%c%V%) %P',
  \ '%#ErrorMsg#%{SyntasticStatuslineFlag()}%*',
  \ ])

" }}} Plugins

" Vimscript {{{

let g:vim_indent_cont = &shiftwidth

" }}} Vimscript

" Python {{{

let python_no_builtin_highlight = 1
let python_space_error_highlight = 1

" }}} Python

" Haskell {{{

let g:ghcmod_ghc_options     = ['-fno-code']
let g:haddock_browser        = 'xdg-open'
let g:haskell_autotags       = 1
let g:haskell_conceal_wide   = 0
let g:haskell_tags_generator = 'hasktags'
let g:hdevtools_options      = '-g-fno-code'
let g:hpaste_author          = 'donri'

let g:syntastic_haskell_checker_args =
  \ '-h-XXmlSyntax -h-i"Use import/export shortcut" -h--cpp-include=include -g-Iinclude -g-fno-warn-name-shadowing -g-fno-code -g-ibench:bin:src:test'


" }}} Haskell

" Shellscript {{{

let g:is_bash         = 1
let g:sh_fold_enabled = 1

" }}} Shellscript

" Rust {{{

let g:no_rust_conceal = 1

" }}} Rust

" }}} Settings


" Workarounds {{{

augroup Workarounds
  auto!
  auto ColorScheme
    \ * filetype detect
    \ | highlight! link SignColumn FoldColumn

    " \ | highlight! link CursorLineNr LineNr
    " \ | highlight! link FoldColumn Folded
    " \ | highlight! link Folded LineNr
    " \ | highlight! link Directory Typedef
    " \ | highlight! link Conceal Operator
augroup END

" }}} Workarounds


" Reloading {{{

augroup VIMRC
  auto!
  auto BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" }}} Reloading
