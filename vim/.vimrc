set nocompatible


" Remap <Leader> before any plugins reads it
let mapleader = ','


" Load Vundle for managing scripts
set runtimepath+=~/.vim/vundle/
call vundle#rc()


" Color schemes
Bundle 'Zenburn'
Bundle 'Solarized'
Bundle 'BusyBee'
Bundle 'Sorcerer'
Bundle 'Color-Sampler-Pack'
Bundle 'git://github.com/trapd00r/neverland-vim-theme.git'
Bundle 'git://github.com/fmeyer/vim-pigraph.git'

Bundle 'neutron.vim'
Bundle 'mayansmoke'
Bundle 'Warm-grey'


" Filetypes
Bundle 'python.vim'
Bundle 'pythoncomplete'
Bundle 'xml.vim'
Bundle 'genshi.vim'
Bundle 'git://github.com/petdance/vim-perl.git'
Bundle 'git://github.com/cakebaker/scss-syntax.vim.git'


" Features
Bundle 'surround.vim'
Bundle 'unimpaired.vim'
Bundle 'lodgeit.vim'

Bundle 'fugitive.vim'
Bundle 'gitv'

Bundle 'SuperTab-continued.'
Bundle 'UltiSnips'
Bundle 'L9'

Bundle 'FuzzyFinder'
Bundle 'Command-T'

Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'

Bundle 'Conque-Shell'
Bundle 'git://github.com/godlygeek/tabular.git'


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


" Always use four spaces for tabs and indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Except for these filetypes
au FileType xml,html,css,scss,javascript setl sw=2 sts=2 ts=2


" Treat HTML as XHTML and Genshi
au FileType html setl ft=xhtml ft=genshi
au BufNewFile *.html 0read ~/.vim/skeleton.html


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

" Folds
set foldmethod=syntax
set nofoldenable

au FileType python setl foldenable


" Misc mappings
nnoremap <C-L> :nohl<CR><C-L>
