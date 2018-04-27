#!/usr/bin/env bash

if [ "$1" == "--blank" ]
then
	light > /tmp/brightness_value
        light -S 0
        i3-msg mode "Blank"
fi

if [ "$1" == "--show" ]
then
	xargs light -S < /tmp/brightness_value
	rm /tmp/brightness_value
	i3-msg mode default
fi
