#!/usr/bin/env bash

FILE="$HOME/screenshots/$(date +'%FT%H-%M-%S').png"

maim -s -o -c 1,0,0,0.2 -l "$FILE"

xclip -selection clipboard -t image/png -i $FILE
