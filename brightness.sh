#!/bin/bash

case $BLOCK_BUTTON in
    4) light | awk '{print int($1*1.1)+1}' | xargs light -S ;;
    5) light | awk '{print int($1/1.1)}' | xargs light -S ;;
esac

light | awk '{ print int($1)"%" }'
