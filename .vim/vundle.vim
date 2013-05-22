Bundle 'gmarik/vundle'


" Colorschemes {{{

Bundle 'neutron.vim'
Bundle 'vydark'
Bundle 'vylight'
Bundle 'Zenburn'

Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'chriskempson/vim-tomorrow-theme'

" }}}


" Features {{{

Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'renamer.vim'

Bundle 'adinapoli/vim-markmultiple'
Bundle 'Bogdanp/quicksilver.vim'
Bundle 'chrisbra/Recover.vim'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'SirVer/ultisnips'

Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rhubarb'
Bundle 'tpope/vim-scriptease'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" }}}


" Filetypes {{{

Bundle 'adinapoli/cumino'
Bundle 'bitc/vim-hdevtools'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'hallison/vim-markdown'
Bundle 'ujihisa/neco-ghc'

Bundle 'mozilla/rust', {'rtp': 'src/etc/vim'}

Bundle 'dag/vim2hs'
" Bundle 'dag/vim-haskell-syntax'

" }}}


" Reloading {{{

augroup Vundle
  auto!
  auto BufWritePost ~/.vim/vundle.vim nested source ~/.vim/vundle.vim
augroup END

" }}} Reloading
