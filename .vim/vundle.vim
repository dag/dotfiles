Bundle 'gmarik/vundle'

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
Bundle 'ujihisa/neco-ghc'

Bundle 'dag/vim2hs'

" }}}


" Reloading {{{

augroup Vundle
  auto!
  auto BufWritePost ~/.vim/vundle.vim nested source ~/.vim/vundle.vim
augroup END

" }}} Reloading
