#!/bin/bash
for f (*.xbm) convert -fill $1 -transparent white -colorize 100 $f $f.png
