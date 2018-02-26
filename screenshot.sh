#!/usr/bin/env bash

FILE="$HOME/screenshots/$(date +'%FT%H-%M-%S').png"

maim -s -c 1,0,0,0.2 -l "$FILE"

xclip -selection clipboard -t image/png -i $FILE
