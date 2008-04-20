#!/bin/sh

if ! screen -ls irc | grep -q 'There is a screen'; then
  screen -d -m -S irc weechat-curses -a
fi

if ! screen -ls p2p | grep -q 'There is a screen'; then
  screen -d -m -S p2p rtorrent
fi

xsetroot -bg 0
sh ~/.fehbg

mkdir -p ~/.amazing/logs
amazing >> ~/.amazing/logs/amazing.log 2>> ~/.amazing/logs/error.log &

unclutter -root -idle 1 &

pkill ssh-agent
eval `ssh-agent`

exec awesome
