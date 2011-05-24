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

writecode () {
  echo -ne "\e[$1;$2m$3\e[00m"
}

vcprompt_format() {
  writecode $normal $green "%n:"
  writecode $bold   $white "%b"
  writecode $normal $green "%m%u"
}


prompt_command() {
  local exitval=$?

  if [ $exitval -ne 0 ]; then
    echo
    writecode $bold $white ←
    writecode $bold $red   " $exitval"
  fi

  echo
  writecode $normal $green "$USER@$HOSTNAME"
  writecode $bold   $blue  " ${PWD/#$HOME/~}"
  vcprompt -f " $(vcprompt_format)"

  if [ -n "$VIRTUAL_ENV" ]; then
    writecode $normal $green " env:"
    writecode $bold   $white "${VIRTUAL_ENV#$WORKON_HOME/}"
  fi
  echo
}


if tput setaf 1; then
  PROMPT_COMMAND="prompt_command"
  PS1="$(writecode $bold $white →) "
else
  PS1="\u@\h \w\n→ "
fi

case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;\w - Terminal\a\]$PS1"
  ;;
esac

PROMPT=$PS1
