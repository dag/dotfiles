#!/bin/bash

makedirs() {
  find -type d -exec mkdir -p "$HOME/{}" \;
}

linkfiles() {
  find -type f -exec ln -bs "$PWD/{}" "$HOME/{}" \;
}


install_vim() {
  makedirs
  linkfiles
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ex '+BundleInstall!' '+quit'
  cd ~/.vim/bundle/Command-T/ruby/command-t/
  ruby extconf.rb
  make
  cd
  python -c'import keyword;print "\n".join(keyword.kwlist+dir(__builtins__))' |
    sort | uniq > ~/.vim/python-globals.txt
}

install_bash() {
  makedirs
  linkfiles
}

install_git() {
  linkfiles
}

install_python() {
  linkfiles
}


if [ $# -eq 0 ]; then
  echo "usage: ./install.sh [vim,bash,git,python]"
else
  cd $1
  echo "installing $1 configs"
  eval "install_$1"
fi
