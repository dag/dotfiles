#!/bin/bash

eval "$(dircolors -b)"

export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Dokument/pypy-1.4.1-linux/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export VIRTUALENV_USE_DISTRIBUTE=True
export PROJECT_HOME="$HOME/Dokument"
export ATTEST_PYGMENTS_STYLE=monokai
export TERM="xterm-256color"
