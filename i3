###############################################################################
# Startup
###############################################################################

exec "compton -b"
exec "setxkbmap -layout gb"

set $mod Mod4

###############################################################################
# Configuration
###############################################################################

# Require click to refocus window
focus_follows_mouse no

# Set font
font pango:Roboto 8

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Set gap sizes
gaps inner 10
gaps outer -5

# Hide gaps when there is only a single window
smart_gaps true

# Hide all windows borders
new_window none
new_float none

###############################################################################
# Application hotkeys
###############################################################################

# Kill focused window
bindsym $mod+Escape kill

# Start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run

# Start a terminal
bindsym $mod+Return exec termite

# Start a atom
bindsym $mod+a exec atom

# Start a browser
bindsym $mod+b exec chromium

# Show ranger
bindsym $mod+r exec "termite --exec=ranger"

# Start a wicd control panel
bindsym $mod+w exec "wicd-gtk -n"
# Cause Wicd to show as floating window
for_window [class="Wicd"] floating enable

# Show volume control
bindsym $mod+v exec pavucontrol
# Cause Pavucontrol to show as floating window
for_window [class="Pavucontrol"] floating enable

# Printscreen
bindsym Print exec "sh ~/git/config/screenshot"

# Lock the station
bindsym $mod+l exec "i3lock -f -e -c 404040"

###############################################################################
# Workspace and window management
###############################################################################

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

# Enter fullscreen mode for the focused container
bindsym $mod+F11 fullscreen toggle

# Toggle split direction
bindsym $mod+s layout toggle split

# Pin floating window
bindsym $mod+p sticky toggle

# Toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# Move focus up and down tree
bindsym $mod+Ctrl+Up focus parent
bindsym $mod+Ctrl+Down focus child

# Create new workspace
bindsym $mod+n exec "i3-input -P 'Workspace name: ' -F 'workspace %s'"

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
bindsym $mod+minus workspace 11:Email
bindsym $mod+equal workspace 12:Media

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
bindsym $mod+Shift+minus move container to workspace 11:Email
bindsym $mod+Shift+equal move container to workspace 12:Media

# Monitor connection hotkey
bindsym $mod+m exec "sh ~/git/config/monitorhotplug"

# Move workspaces between monitors
bindsym $mod+Ctrl+Left move workspace to output eDP-1
bindsym $mod+Ctrl+Right move workspace to output HDMI-A-1; move workspace to output VGA-1

# Back and forth
bindsym $mod+Tab workspace back_and_forth

###############################################################################
# Reload, restart, exit
###############################################################################

# Reload the configuration file
bindsym $mod+F5 reload

# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+F5 restart

# Exit i3 (logs you out of your X session)
bindsym $mod+Ctrl+Escape exec "i3-nagbar -t warning -m 'Do you really want to exit i3?' -b 'Yes, exit i3' 'i3-msg exit'"

###############################################################################
# Bar
###############################################################################

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    i3bar_command i3bar -t
    status_command i3blocks
    strip_workspace_numbers yes
    colors {
        background #000000
        statusline #ffffff
        separator  #666666

        focused_workspace  #4c7899 #285577 #ffffff
        active_workspace   #333333 #5f676a #ffffff
        inactive_workspace #333333 #222222 #888888
        urgent_workspace   #2f343a #900000 #ffffff
        binding_mode       #2f343a #900000 #ffffff
    }
}


###############################################################################
# Key bindings
###############################################################################

# Brightness keys
bindsym XF86MonBrightnessUp exec "sudo xbacklight -fps 60 -time 200 -set 100"
bindsym XF86MonBrightnessDown exec "sudo xbacklight -fps 60 -time 200 -set 1"

# Volume keys
bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute 0 toggle"

# Remap caps lock to middle click
exec "xmodmap -e 'keycode 66 = Pointer_Button2'"

# Mouse button keys to click events
bindsym Pointer_Button1 exec "xdotool click 1"
bindsym Pointer_Button2 exec "xdotool click 2"
bindsym Pointer_Button3 exec "xdotool click 3"
