###############################################################################
# Startup
###############################################################################

exec "numlockx"
exec "feh --bg-fill ~/background.png"

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

# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# Set gap sizes
gaps inner 10
gaps outer -5

# Hide gaps when there is only a single window
smart_gaps true

# Hide all windows borders
new_window none
new_float none

# Kill focused window
bindsym $mod+Escape kill

###############################################################################
# Application hotkeys
###############################################################################

# Start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run

# Start a terminal
bindsym $mod+Return exec termite
bindsym $mod+KP_Enter exec termite

# Start atom
bindsym $mod+a exec atom

# Start a browser
bindsym $mod+b exec chromium

# Start Jetbrains Toolbox
bindsym $mod+j exec jetbrains-toolbox

# Start ranger
bindsym $mod+r exec "termite --exec=ranger"

# Start htop
bindsym $mod+h exec "termite --exec=htop"

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
bindsym $mod+l exec "i3lock -f -e -t -i ~/lock.png -c 404040"

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
bindsym $mod+f fullscreen toggle

# Toggle split direction
bindsym $mod+t layout toggle all
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

# Custom named workspaces
bindsym $mod+n exec "i3-input -P 'Workspace name: ' -F 'workspace %s'"
bindsym $mod+Shift+n exec "i3-input -P 'Destination workspace name: ' -F 'move container to workspace %s'"

# Switch to workspace
bindsym $mod+grave workspace prev
bindsym $mod+BackSpace workspace next

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
bindsym $mod+Mod1+1 workspace 11
bindsym $mod+Mod1+2 workspace 12
bindsym $mod+Mod1+3 workspace 13
bindsym $mod+Mod1+4 workspace 14
bindsym $mod+Mod1+5 workspace 15
bindsym $mod+Mod1+6 workspace 16
bindsym $mod+Mod1+7 workspace 17
bindsym $mod+Mod1+8 workspace 18
bindsym $mod+Mod1+9 workspace 19
bindsym $mod+Mod1+0 workspace 20
bindsym $mod+minus workspace 254:Email
bindsym $mod+equal workspace 255:Media

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
bindsym $mod+Mod1+Shift+1 move container to workspace 11
bindsym $mod+Mod1+Shift+2 move container to workspace 12
bindsym $mod+Mod1+Shift+3 move container to workspace 13
bindsym $mod+Mod1+Shift+4 move container to workspace 14
bindsym $mod+Mod1+Shift+5 move container to workspace 15
bindsym $mod+Mod1+Shift+6 move container to workspace 16
bindsym $mod+Mod1+Shift+7 move container to workspace 17
bindsym $mod+Mod1+Shift+8 move container to workspace 18
bindsym $mod+Mod1+Shift+9 move container to workspace 19
bindsym $mod+Mod1+Shift+0 move container to workspace 20
bindsym $mod+Shift+minus move container to workspace 254:Email
bindsym $mod+Shift+equal move container to workspace 255:Media

# Monitor connection hotkey
bindsym $mod+F8 exec "sh ~/git/config/monitorhotplug"

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

    tray_output none
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
# Media key bindings
###############################################################################

# Brightness
bindsym $mod+F12 exec "light -A 1"
bindsym $mod+F11 exec "light -U 1"

# Brightness on scroll
bindsym --whole-window $mod+button4 exec "light -A 1"
bindsym --whole-window $mod+button5 exec "light -U 1"

# Brightness keys
bindsym XF86MonBrightnessUp exec "sudo xbacklight -fps 60 -time 200 -set 100"
bindsym XF86MonBrightnessDown exec "sudo xbacklight -fps 60 -time 200 -set 1"

# Volume
bindsym $mod+F3 exec "pactl set-sink-volume 0 +5%"
bindsym $mod+F2 exec "pactl set-sink-volume 0 -5%"
bindsym $mod+F1 exec "pactl set-sink-mute 0 toggle"

# Volume keys
bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute 0 toggle"

# Remap caps lock to middle click
exec_always --no-startup-id /usr/bin/xmodmap -e 'keycode 66 = Pointer_Button2'
exec_always --no-startup-id /usr/bin/xmodmap -e 'keycode 108 = Super_L'

# Mouse button keys to click events
bindsym Pointer_Button1 exec "xdotool click 1"
bindsym Pointer_Button2 exec "xdotool click 2"
bindsym Pointer_Button3 exec "xdotool click 3"
