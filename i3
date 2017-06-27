# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

exec "compton -b"
exec "setxkbmap -layout gb"

set $mod Mod4

# Font for window titles.
font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 8

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Lock the station
bindsym $mod+l exec "i3lock -f -e -c 202020"

# Kill focused window
bindsym $mod+F4 kill

# Start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run

# Start a terminal
bindsym $mod+Return exec termite

# Start a browser
bindsym $mod+b exec chromium

# Show volume control
bindsym $mod+v exec pavucontrol
# Cause Pavucontrol to show as floating window
for_window [class="Pavucontrol"] floating enable

# Move focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# Move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# Split in horizontal orientation
bindsym $mod+Shift+h split h
# Split in vertical orientation
bindsym $mod+Shift+v split v

# enter fullscreen mode for the focused container
bindsym $mod+F11 fullscreen toggle

# Toggle split direction
bindsym $mod+s layout toggle split

# Toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# Move focus up and down tree
bindsym $mod+Ctrl+Up focus parent
bindsym $mod+Ctrl+Down focus child

# Switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# Move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# Reload the configuration file
bindsym $mod+Shift+c reload
# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# Exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Resize window (you can also use the mouse for that)
mode "resize" {
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
}

gaps inner 10
gaps outer -5

new_window none
new_float none
