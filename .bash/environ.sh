#!/bin/bash

eval "$(dircolors -b)"

export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"
export PATH="$HOME/.gem/ruby/1.9.1/bin:$PATH"
export PATH="$HOME/.perl6/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="cabal-dev/bin:$PATH"

#export PYTHONSTARTUP="$HOME/.pythonrc"
export VIRTUALENV_USE_DISTRIBUTE=True
export VIRTUAL_ENV_DISABLE_PROMPT=True
export PROJECT_HOME="$HOME/Code"
export PIP_VIRTUALENV_BASE="$HOME/.virtualenvs"

export LESS="FRX"
export EDITOR="vim"
export VISUAL="$EDITOR"
export BROWSER="xdg-open"