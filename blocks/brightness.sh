#!/bin/bash

case $BLOCK_BUTTON in
    4) light | awk '{print int($1*1.1)+1}' | xargs light -S ;;
    5) light | awk '{print int($1/1.1)}' | xargs light -S ;;

    1) ;& 8) light -kU 50 ;;
    3) ;& 9) light -kA 50 ;;
esac

light | awk '{ print int($1)"%" }'
