#!/bin/bash

case $BLOCK_BUTTON in
    1) light -k | awk '{print ($1>50) ? 50 : 50-int($1)}' | xargs light -kS ;;
    4) light | awk '{print int($1*1.1)+1}' | xargs light -S ;;
    5) light | awk '{print int($1/1.1)}' | xargs light -S ;;
esac

light | awk '{ print int($1)"%" }'
