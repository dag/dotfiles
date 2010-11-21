set nocompatible


" Load Vundle for managing scripts
set runtimepath+=~/.vim/vundle/
call vundle#rc()

" Vundle bundles
Bundle "Color-Sampler-Pack"
Bundle "BusyBee"
Bundle "Python-2.x-Standard-Library-Reference"

Bundle "python.vim"
Bundle "xml.vim"

Bundle "lodgeit.vim"
Bundle "fugitive.vim"
Bundle "SuperTab-continued."
Bundle "UltiSnips"
Bundle "\L9"
Bundle "FuzzyFinder"


" Mappings for FuzzyFinder
nnoremap <silent> sp :FufCoverageFileChange Python<CR>
nnoremap <silent> st :FufCoverageFileChange Templates<CR>
nnoremap <silent> so :FufCoverageFileChange All<CR>
nnoremap <silent> sj :FufBuffer<CR>
nnoremap <silent> sd :FufDir ~/Documents/<CR>


" Load Skynet
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
runtime macros/matchit.vim


" Always use four spaces for tabs and indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Except for these filetypes
autocmd FileType xml,html,css setlocal shiftwidth=2 softtabstop=2 tabstop=2


" Misc settings
set hidden
set showcmd
set hlsearch
set wildmenu
set nomodeline
set scrolloff=3
set path=.,~,~/Documents/*
set autoindent
set confirm
set textwidth=75

" Folds
set foldmethod=indent
set nofoldenable


" Highlight long lines, whitespace ending lines, and tabs
match SpellBad /.\%>79v\|\s\+$\|\t/


" Misc mappings
nnoremap <C-L> :nohl<CR><C-L>
