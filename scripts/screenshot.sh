#!/usr/bin/env bash

FILE="$HOME/screenshots/$(date +'%FT%H-%M-%S').png"

maim --select --delay=0.1 --noopengl --color=1,0,0,0.2 --highlight "$FILE"

xclip -selection clipboard -target image/png -in $FILE
