#!/usr/bin/env bash

if [[ "$1" == "--night" ]]
then
	# Wait for charger to be plugged in
	if [[ $(acpi -a | grep on-line | wc -l) -eq 0 ]]
	then
		i3-nagbar -m "Plug in AC adapter" &

		while [[ $(acpi -a | grep on-line | wc -l) -eq 0 ]]
		do
			if [[ $(jobs -r | wc -l) -eq 0 ]]
			then
				i3-msg mode default
				exit
			fi
			
			sleep 0.1
		done

		kill $!
	fi

	light -S 1
	light -s $(light -L | grep kbd) -S 0
	pactl set-sink-volume 0 5%
	i3-msg mode "Night"
fi

if [[ "$1" == "--black" ]]
then
	light -S 0
	i3-msg mode "Night (Black)"
fi

if [[ "$1" == "--day" ]]
then
	light -S 20
	light -s $(light -L | grep kbd) -S 50
	pactl set-sink-volume 0 20%
	i3-msg mode default
fi
