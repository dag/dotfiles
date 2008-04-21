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

function RubyEndToken ()
  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) >= 0
    return "\<CR>}\<C-O>O"
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O"
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O"
  else
    return "\<CR>"
  endif
endfunction

if has("autocmd")
  filetype plugin indent on

  augroup vimrcEx
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup ruby
    autocmd FileType ruby setlocal path+=lib,lib/**/* softtabstop=2 shiftwidth=2
    autocmd FileType ruby imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

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
