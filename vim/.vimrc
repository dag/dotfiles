set nocompatible


" Remap <Leader> before any plugins reads it
let mapleader = ','


" Load Vundle for managing scripts
set runtimepath+=~/.vim/vundle/
call vundle#rc()


" Color schemes
Bundle 'Zenburn'
"Bundle "Color-Sampler-Pack"
"Bundle "BusyBee"
"Bundle "neutron.vim"
"Bundle "mayansmoke"
"Bundle "trivial256"
"Bundle "TuttiColori-Colorscheme"
"Bundle "simplewhite.vim"
"Bundle "seashell"
"Bundle "reliable"
"Bundle "osx_like"
"Bundle "montz.vim"
"Bundle "literal_tango.vim"
"Bundle "louver.vim"
"Bundle "kate.vim"
"Bundle "guepardo.vim"
"Bundle "Warm-grey"
"Bundle "softlight.vim"
"Bundle "github-theme"
"Bundle "git://github.com/trapd00r/neverland-vim-theme.git"
"Bundle "Sorcerer"
"Bundle "git://github.com/altercation/vim-colors-solarized.git"
"Bundle "https://github.com/fmeyer/vim-pigraph.git"

" Filetypes
"Bundle "Python-2.x-Standard-Library-Reference"
Bundle "python.vim"
"Bundle 'python.vim--Vasiliev'
Bundle "pythoncomplete"
"Bundle "pyflakes.vim"
Bundle "xml.vim"
Bundle 'genshi.vim'
"Bundle "git://github.com/petdance/vim-perl.git"
Bundle 'git://github.com/cakebaker/scss-syntax.vim.git'

" Features
Bundle "surround.vim"
Bundle 'unimpaired.vim'
"Bundle 'VimPdb'
Bundle "lodgeit.vim"
Bundle "fugitive.vim"
Bundle 'gitv'
Bundle "SuperTab-continued."
Bundle "UltiSnips"
Bundle "\L9"
Bundle "FuzzyFinder"
Bundle 'Command-T'
Bundle "Conque-Shell"
Bundle "The-NERD-Commenter"
Bundle 'The-NERD-tree'
Bundle "git://github.com/godlygeek/tabular.git"
"Bundle 'https://github.com/Lokaltog/vim-easymotion.git'


" Mappings for FuzzyFinder
nnoremap <silent> sp :FufCoverageFileChange Python<CR>
nnoremap <silent> sq :FufQuickfix<CR>
nnoremap <silent> st :FufTag<CR>
nnoremap <silent> so :FufCoverageFileChange All<CR>
nnoremap <silent> sj :FufBuffer<CR>
nnoremap <silent> sd :FufDir ~/Do[ck]ument{s,}/;<CR>


" Pyflakes makes its own quickfix list the active one on any edit
let g:pyflakes_use_quickfix = 0

" Other Python options
let g:python_highlight_all = 1
let g:python_slow_sync = 1
autocmd FileType python setlocal complete+=k~/.vim/python-globals.txt


" Load Skynet
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,longest
runtime macros/matchit.vim
let g:SuperTabDefaultCompletionType = "context"


" Console Vim scheme
"let g:solarized_termcolors = 16
"let g:solarized_termtrans = 1
set background=dark
"let g:zenburn_high_Contrast = 1
colorscheme zenburn


" Always use four spaces for tabs and indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Except for these filetypes
au FileType xml,html,css,javascript setl sw=2 sts=2 ts=2


" Treat HTML as XHTML and Genshi
autocmd FileType html setlocal filetype=xhtml
autocmd FileType html setlocal filetype=genshi
autocmd BufNewFile *.html 0read ~/.vim/skeleton.html


" Perl 6
autocmd FileType perl setlocal filetype=perl6


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
set relativenumber

" Folds
set foldmethod=syntax
set nofoldenable

au FileType python setl foldenable


" Highlight long lines
"match SpellBad /.\%>79v/


" Misc mappings
nnoremap <C-L> :nohl<CR><C-L>
