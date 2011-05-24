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
  python -c'import keyword;print "\n".join(keyword.kwlist+dir(__builtins__))' |
    sort | uniq > ~/.vim/python-globals.txt
}

install_bash() {
  makedirs
  linkfiles
}


if [ $# -eq 0 ]; then
  echo usage: ./install.sh [vim,bash]
else
  cd $1
  echo installing $1 configs
  eval "install_$1"
fi
