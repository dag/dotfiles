set autoindent
set background=dark
set backspace=indent,eol,start
set expandtab
set ignorecase
set incsearch
set incsearch
set mouse=a
set nocompatible
set number
set path+=lib,lib/**/*
set ruler
set shiftwidth=2
set smartcase
set t_Co=256
set visualbell
set wildmenu
set wrap

if has("autocmd")
  filetype plugin indent on

  augroup vimrcEx
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup ruby
    autocmd FileType ruby setlocal path+=lib,lib/**/* softtabstop=2 shiftwidth=2

  augroup markdown
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:>

  augroup end
endif

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

map <C-l> :noh<CR>
imap <C-l> <ESC>:noh<CR>

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

colorscheme gigamo
