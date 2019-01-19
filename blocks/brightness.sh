#!/bin/bash

case ${BLOCK_BUTTON} in
    1) light -s $(light -L | grep kbd) | awk '{print ($1>50) ? 50 : 50-int($1)}' | xargs light -s $(light -L | grep kbd) -S ;;

    4) light | awk '{print int($1*1.1)+1}' | xargs light -S ;;
    5) light | awk '{print int($1/1.1)}' | xargs light -S ;;

    8) light -s $(light -L | grep kbd) -U 50 ;;
    9) light -s $(light -L | grep kbd) -A 50 ;;
esac

light | awk '{ print int($1)"%" }'
