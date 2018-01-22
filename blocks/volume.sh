#!/bin/bash

case $BLOCK_BUTTON in
    1) pactl set-sink-mute 0 toggle ;;
    4) pactl set-sink-volume 0 +1% ;;
    5) pactl set-sink-volume 0 -1% ;;
esac

if [ $(pamixer --get-mute) = true ]
then
  pamixer --get-volume | xargs printf '(%d%%)'
else
  pamixer --get-volume | xargs printf '%d%%'
fi
