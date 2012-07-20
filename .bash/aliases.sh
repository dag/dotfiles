#!/bin/bash

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -AC -I "*.pyc|_darcs|cabal-dev|dist|state"'

alias apt-get='sudo apt-get'

alias open='xdg-open'
alias e='gvim'
alias l='less'

alias y='sudo yum'
complete -F _yum y

alias git='hub'
alias g='git'
complete -F _git g

alias d='darcs'
complete -F _darcs d

function d-wh {
  darcs whatsnew --unified "$@" | pygmentize -l udiff | less
}

function d-di {
  darcs diff --unified "$@" | pygmentize -l udiff | less
}

function d-log {
  darcs changes --summary "$@" | gvim -R "+set filetype=changelog" - >/dev/null
}

alias mk='make -j3'
alias m='mk'
complete -F _make mk m

alias hlint='hlint -c -XXmlSyntax'
alias hgl='hoogle search --color --count 10'
alias yi='yi --as=vim'
alias c='PATH=$PWD/cabal-dev/bin:$PATH cabal-dev'

_cabal()
{
    local cur
    cur=${COMP_WORDS[$COMP_CWORD]}
    local cmd
    cmd=( ${COMP_WORDS[@]} )
    cmd[0]="cabal"
    cmd[${COMP_CWORD}]="--list-options"
    COMPREPLY=( $( compgen -W "$( ${cmd[@]} )" -- $cur ) )
}

complete -F _cabal -o default cabal-dev c

alias rm='trash-put'

hash ack-grep &>/dev/null && alias ack='ack-grep'
hash pip-python &>/dev/null && alias pip='pip-python'
hash vimx &>/dev/null && alias vim='vimx'

function use-ghc-7.4.1 {
  source ~/.virthualenv/7.4.1/.virthualenv/bin/activate
  export PS1="$VIRTHUALENV_PS1_BACKUP"
}
