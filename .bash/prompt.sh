#!/bin/bash

normal=0
bold=1
underlined=4

black=30
red=31
green=32
yellow=33
blue=34
purple=35
cyan=36
white=37
default=39

function print-with-colors {
  echo -ne "\e[$1;$2m$3\e[00m"
}

function vcprompt-format {
  print-with-colors $normal $green   "%n:"
  print-with-colors $bold   $default "%b"
  print-with-colors $normal $green   "%m%u"
}


function prompt-command {
  local exitval=$?

  if [ $exitval -ne 0 ]; then
    echo
    print-with-colors $normal $red     "exit:"
    print-with-colors $bold   $default "$exitval"
  fi

  echo
  print-with-colors $normal $green "$USER@$HOSTNAME"
  print-with-colors $bold   $blue  " ${PWD/#$HOME/~}"

  if hash vcprompt &>/dev/null; then
    vcprompt -f " $(vcprompt-format)"
  fi

  if [ -n "$VIRTUAL_ENV" ]; then
    print-with-colors $normal $green   " env:"
    print-with-colors $bold   $default "${VIRTUAL_ENV#$WORKON_HOME/}"
  fi

  if [ -n "$VIRTHUALENV_NAME" ]; then
    print-with-colors $normal $green   " ghc:"
    print-with-colors $bold   $default "$VIRTHUALENV_NAME"
  fi

  if [ -n "$SANDBOXER_BOX" ]; then
    print-with-colors $normal $green   " cabal:"
    print-with-colors $bold   $default "$SANDBOXER_BOX"
  fi

  echo
}


if [ $UID -eq 0 ]; then
  PROMPT_PREFIX="#"
else
  PROMPT_PREFIX="$"
fi


if tput setaf 1 &>/dev/null; then
  PROMPT_COMMAND="prompt-command"
  PS1="\[$(print-with-colors $bold $default '\]$PROMPT_PREFIX\[')\] "
else
  PS1="\u@\h \w\n$PROMPT_PREFIX "
fi

case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;\w - Terminal\a\]$PS1"
  ;;
esac

PROMPT=$PS1
