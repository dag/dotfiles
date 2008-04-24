#!/bin/bash
for f in *.xbm; do convert -fill $1 -transparent white -colorize 100 $f $f.png; done
