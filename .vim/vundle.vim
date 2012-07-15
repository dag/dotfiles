Bundle 'gmarik/vundle'


" Colorschemes {{{

Bundle 'aerosol/vim-compot'
Bundle 'altercation/vim-colors-solarized'
Bundle 'djjcast/mirodark'
Bundle 'neutron.vim'
Bundle 'noahfrederick/Hemisu'
Bundle 'vydark'
Bundle 'vylight'

" }}}


" Features {{{

Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'renamer.vim'

Bundle 'Bogdanp/quicksilver.vim'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
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
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" }}}


" Filetypes {{{

Bundle 'eagletmt/ghcmod-vim'
Bundle 'hallison/vim-markdown'
Bundle 'ujihisa/neco-ghc'

Bundle 'dag/vim2hs'

" }}}


" Reloading {{{

augroup Vundle
  auto!
  auto BufWritePost ~/.vim/vundle.vim nested source ~/.vim/vundle.vim
augroup END

" }}} Reloading
