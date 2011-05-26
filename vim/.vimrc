" Remap <Leader> before any plugins reads it
let mapleader = ','

" Bundles managed by Vundle
source ~/.vim/bundles.vim


" Mappings for FuzzyFinder
nnoremap <silent> sp :FufCoverageFileChange Python<CR>
nnoremap <silent> sq :FufQuickfix<CR>
nnoremap <silent> st :FufTag<CR>
nnoremap <silent> so :FufCoverageFileChange All<CR>
nnoremap <silent> sj :FufBuffer<CR>
nnoremap <silent> sd :FufDir ~/Do[ck]ument{s,}/;<CR>


" Python options
let python_highlight_all = 1

" add completions for builtins to python
au FileType python setl cpt+=k~/.vim/python-globals.txt

" indent python with four spaces
au FileType python setl et sw=4 sts=4 ts=4

" fold docstrings
au FileType python setl fdm=syntax fen


" Load Skynet
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,longest
runtime macros/matchit.vim
let g:SuperTabDefaultCompletionType = "context"


" Console Vim scheme
set background=dark
colorscheme zenburn


" Treat HTML as XHTML and Genshi
au FileType html setl ft=xhtml ft=genshi
au BufNewFile *.html 0read ~/.vim/skeleton.html


" Perl 6
autocmd FileType perl setlocal filetype=perl6


" Use two spaces for tabs and indent by default
set et sw=2 sts=2 ts=2


" Misc settings
set hidden
set showcmd
set hlsearch
set wildmenu
set nomodeline
set scrolloff=3
set path=.,~,~/Documents/*
set cdpath=.,~,~/Documents
set autoindent
set confirm
set textwidth=75
set mouse=a

" Folds
set foldmethod=syntax
set nofoldenable


" Misc mappings
nnoremap <C-L> :nohl<CR><C-L>
