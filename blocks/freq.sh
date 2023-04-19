#!/bin/bash

case $BLOCK_BUTTON in
    1) sudo /usr/bin/cpupower -c all frequency-set -u 4GHz   > /dev/null ;;
    2) sudo /usr/bin/cpupower -c all frequency-set -u 1.6GHz   > /dev/null ;;
    3) sudo /usr/bin/cpupower -c all frequency-set -u 400MHz > /dev/null ;;
esac

cpupower -c all frequency-info -f | awk '/current CPU frequency/ {sum+=$4*1000; count+=1;} END {printf "%i", sum/count}' | numfmt --to=si --suffix=Hz
