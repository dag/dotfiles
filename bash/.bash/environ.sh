#!/bin/bash

eval "$(dircolors -b)"

export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"
export PATH="$HOME/.gem/ruby/1.9.1/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PYTHONSTARTUP="$HOME/.pythonrc"
export VIRTUALENV_USE_DISTRIBUTE=True
export PROJECT_HOME="$HOME/Documents"
export PIP_VIRTUALENV_BASE="$HOME/.virtualenvs"
