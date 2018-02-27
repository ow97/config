if [ $(light | awk '{ print int($1) }') -gt 0 ]
then
	light > /tmp/brightness_value
	light -S 0
else
	xargs light -S < /tmp/brightness_value
	rm /tmp/brightness_value
fi
