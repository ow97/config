#!/usr/bin/env bash

VGA_STATUS=
HDMI_STATUS=

if [[ -d "/sys/class/drm/card0/card0-VGA-1" ]]; then
    VGA_STATUS=$(</sys/class/drm/card0/card0-VGA-1/status )
    HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )
elif [[ -d "/sys/class/drm/card1/card1-VGA-1" ]]; then
    VGA_STATUS=$(</sys/class/drm/card1/card1-VGA-1/status )
    HDMI_STATUS=$(</sys/class/drm/card1/card1-HDMI-A-1/status )
fi

echo "$VGA_STATUS"
echo "$HDMI_STATUS"

if [[ "connected" == "$VGA_STATUS" ]]; then
    xrandr --output VGA-1 --auto --pos 0x0
    xrandr --output eDP-1 --auto --pos 1440x900
else
    xrandr --output VGA-1 --off
fi

if [[ "connected" == "$HDMI_STATUS" ]]; then
    xrandr --output HDMI-1 --auto --pos 1920x1080
else
    xrandr --output HDMI-1 --off
fi

feh --bg-fill ~/img/background.jpg
