#!/bin/bash

STATUS_FILE="$HOME/.personal_status"
MENU="awesome-menu"
WEECHAT="$HOME/.weechat"

touch $STATUS_FILE

STATUS="$((echo back; cat $STATUS_FILE) | $MENU "$@")"

weechat_tell() {
  for fifo in $WEECHAT/weechat_fifo_*; do
    echo "$1" > $fifo
  done
}

case $STATUS in
  back)
    echo > $STATUS_FILE
    weechat_tell "*/away -all"
    ;;
  "")
    ;;
  *)
    echo $STATUS > $STATUS_FILE
    weechat_tell "*/away -all $STATUS"
    ;;
esac

