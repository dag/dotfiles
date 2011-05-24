#!/bin/bash

# Check for color support
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  txtblk='\e[0;30m' # Black - Regular
  txtred='\e[0;31m' # Red
  txtgrn='\e[0;32m' # Green
  txtylw='\e[0;33m' # Yellow
  txtblu='\e[0;34m' # Blue
  txtpur='\e[0;35m' # Purple
  txtcyn='\e[0;36m' # Cyan
  txtwht='\e[0;37m' # White
  bldblk='\e[1;30m' # Black - Bold
  bldred='\e[1;31m' # Red
  bldgrn='\e[1;32m' # Green
  bldylw='\e[1;33m' # Yellow
  bldblu='\e[1;34m' # Blue
  bldpur='\e[1;35m' # Purple
  bldcyn='\e[1;36m' # Cyan
  bldwht='\e[1;37m' # White
  undblk='\e[4;30m' # Black - Underline
  undred='\e[4;31m' # Red
  undgrn='\e[4;32m' # Green
  undylw='\e[4;33m' # Yellow
  undblu='\e[4;34m' # Blue
  undpur='\e[4;35m' # Purple
  undcyn='\e[4;36m' # Cyan
  undwht='\e[4;37m' # White
  bakblk='\e[40m'   # Black - Background
  bakred='\e[41m'   # Red
  bakgrn='\e[42m'   # Green
  bakylw='\e[43m'   # Yellow
  bakblu='\e[44m'   # Blue
  bakpur='\e[45m'   # Purple
  bakcyn='\e[46m'   # Cyan
  bakwht='\e[47m'   # White
  txtrst='\e[00m'   # Text reset

  # Title
  case "$TERM" in
  xterm*|rxvt*)
    title='\[\e]0;\w$(vcprompt -f " (%n:%b%m%u)") - Terminal\a\]'
    ;;
  esac

  _exitstatus() {
    if [ $1 -ne 0 ]; then
      echo -e "\n$bldwht← $bldred$1$txtrst\n"
    fi
  }

  export VCPROMPT_FORMAT="$(echo -e " $txtgrn%n:$bldwht%b$txtgrn%m%u$txtrst")"

  _virtualenv() {
    if [ -n "$VIRTUAL_ENV" ]; then
      echo -e " ${txtgrn}env:$bldwht$(basename $VIRTUAL_ENV)$txtrst"
    fi
  }

  es='$(_exitstatus $?)'
  user="\[$txtgrn\]\u@\h\[$txtrst\]"
  dir="\[$bldblu\]\w\[$txtrst\]"
  vcs='$(vcprompt)'
  env='$(_virtualenv)'
  prompt="\[$bldwht\]→\[$txtrst\] "

  PS1="$es$title$txtrst\n$user $dir$vcs$env\n$prompt"
  unset title user dir vcs env es prompt
else # No color support
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

PROMPT="$PS1"
