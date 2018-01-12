###############################################################################
# Startup
###############################################################################

exec "numlockx"
exec "feh --bg-fill ~/background.png"

exec "compton -b"
exec "setxkbmap -layout gb"

# Remap caps lock to middle click
exec_always --no-startup-id /usr/bin/xmodmap -e 'keycode 66 = Pointer_Button2'
#exec_always --no-startup-id /usr/bin/xmodmap -e 'keycode 108 = Super_L'

###############################################################################
# Configuration
###############################################################################

# Require click to refocus window
focus_follows_mouse no

# Set font
font pango:Roboto 8

# Use Mouse+$mod to drag floating windows
floating_modifier Mod4

# Set gap sizes
gaps inner 10
gaps outer -5

# Hide gaps when there is only a single window
smart_gaps true

# Hide all windows borders
new_window none
new_float none

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
# Key bindings
###############################################################################

# Printscreen
bindsym Print exec "sh ~/git/config/screenshot"

# Volume keys
bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute 0 toggle"

# Mouse button keys to click events
bindsym Pointer_Button1 exec "xdotool click 1"
bindsym Pointer_Button2 exec "xdotool click 2"
bindsym Pointer_Button3 exec "xdotool click 3"

###############################################################################
# Window styles
###############################################################################

for_window [class="Wicd"] floating enable
for_window [class="Pavucontrol"] floating enable

###############################################################################
# Command structure
###############################################################################

bindsym ISO_Level3_Shift mode Command

bindsym Mod4+F5 restart

bindsym Mod4+Tab workspace back_and_forth
bindsym Mod4+grave workspace prev
bindsym Mod4+BackSpace workspace next

# Monitor connection hotkey
bindsym Mod4+F8 exec "sh ~/git/config/monitorhotplug"

bindsym Mod4+F11 fullscreen toggle

bindsym Mod4+1 mode default
bindsym Mod4+2 mode default
bindsym Mod4+3 mode default
bindsym Mod4+4 mode default
bindsym Mod4+5 mode default
bindsym Mod4+6 mode default
bindsym Mod4+7 mode default
bindsym Mod4+8 mode default
bindsym Mod4+9 mode default
bindsym Mod4+0 mode default
bindsym Mod4+a mode default
bindsym Mod4+b move workspace to output eDP-1
bindsym Mod4+c mode default
bindsym Mod4+d exec dmenu_run
bindsym Mod4+e mode Execute
bindsym Mod4+f mode "Change Focus"
bindsym Mod4+g mode default
bindsym Mod4+h split h
bindsym Mod4+i exec i3-input
bindsym Mod4+j mode default
bindsym Mod4+k mode default
bindsym Mod4+l exec "i3lock -f -e -t -i ~/lock.png -c 404040"
bindsym Mod4+m mode "Move Window"
bindsym Mod4+n exec i3-input -F 'workspace "%s"' -P 'Workspace name: '
bindsym Mod4+o mode "Move and Follow"
bindsym Mod4+p mode "Position Window"
bindsym Mod4+q kill
bindsym Mod4+r exec i3-input -F 'rename workspace to "%s"' -P 'New name: '
bindsym Mod4+s sticky toggle
bindsym Mod4+t mode default
bindsym Mod4+u mode default
bindsym Mod4+v split v
bindsym Mod4+w mode Workspace
bindsym Mod4+x move workspace to output HDMI-1
bindsym Mod4+y mode default
bindsym Mod4+z mode default

bindsym Mod4+Return exec termite
bindsym Mod4+KP_Enter exec termite

# Focus move
bindsym Mod4+Left focus left
bindsym Mod4+Down focus down
bindsym Mod4+Up focus up
bindsym Mod4+Right focus right

bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Up move up
bindsym Mod4+Shift+Right move right

# Use volume rocker to change brightness
bindsym Mod4+XF86AudioRaiseVolume exec "light -A 4"
bindsym Mod4+XF86AudioLowerVolume exec "light -U 4"


mode Command {
    bindsym Escape mode default

    bindsym F5 restart

    bindsym Tab workspace back_and_forth; mode default
    bindsym grave workspace prev
    bindsym BackSpace workspace next

    # Monitor connection hotkey
    bindsym F8 exec "sh ~/git/config/monitorhotplug"
    bindsym F11 fullscreen toggle; mode default

    bindsym 1 mode default
    bindsym 2 mode default
    bindsym 3 mode default
    bindsym 4 mode default
    bindsym 5 mode default
    bindsym 6 mode default
    bindsym 7 mode default
    bindsym 8 mode default
    bindsym 9 mode default
    bindsym 0 mode default
    bindsym a mode default
    bindsym b move workspace to output eDP-1
    bindsym c mode default
    bindsym d exec dmenu_run; mode default
    bindsym e mode Execute
    bindsym f mode "Change Focus"
    bindsym g mode default
    bindsym h split h; mode default
    bindsym i exec i3-input; mode default
    bindsym j mode default
    bindsym k mode default
    bindsym l exec "i3lock -f -e -t -i ~/lock.png -c 404040"
    bindsym m mode "Move Window"
    bindsym n mode default
    bindsym o mode "Move and Follow"
    bindsym p mode "Position Window"
    bindsym q kill; mode default
    bindsym r exec i3-input -F 'rename workspace to "%s"' -P 'New name: '; mode default
    bindsym s mode sticky toggle
    bindsym t mode default
    bindsym u mode default
    bindsym v split v; mode default
    bindsym w mode Workspace
    bindsym x move workspace to output HDMI-1
    bindsym y mode default
    bindsym z mode default

    bindsym Return exec termite; mode default
    bindsym KP_Enter exec termite; mode default

    # Focus move
    bindsym Left focus left; mode default
    bindsym Down focus down; mode default
    bindsym Up focus up; mode default
    bindsym Right focus right; mode default

    bindsym Shift+Left move left; mode default
    bindsym Shift+Down move down; mode default
    bindsym Shift+Up move up; mode default
    bindsym Shift+Right move right; mode default

    # Use volume rocker to change brightness
    bindsym XF86AudioRaiseVolume exec "light -A 4"
    bindsym XF86AudioLowerVolume exec "light -U 4"
}

mode Execute {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default

    bindsym 1 mode default
    bindsym Mod4+1 mode default
    bindsym 2 mode default
    bindsym Mod4+2 mode default
    bindsym 3 mode default
    bindsym Mod4+3 mode default
    bindsym 4 mode default
    bindsym Mod4+4 mode default
    bindsym 5 mode default
    bindsym Mod4+5 mode default
    bindsym 6 mode default
    bindsym Mod4+6 mode default
    bindsym 7 mode default
    bindsym Mod4+7 mode default
    bindsym 8 mode default
    bindsym Mod4+8 mode default
    bindsym 9 mode default
    bindsym Mod4+9 mode default
    bindsym 0 mode default
    bindsym Mod4+0 mode default
    bindsym a exec atom; mode default
    bindsym Mod4+a exec atom; mode default
    bindsym b exec chromium; mode default
    bindsym Mod4+b exec chromium; mode default
    bindsym c mode default
    bindsym Mod4+c mode default
    bindsym d mode default
    bindsym Mod4+d mode default
    bindsym e mode default
    bindsym Mod4+e mode default
    bindsym f mode default
    bindsym Mod4+f mode default
    bindsym g mode default
    bindsym Mod4+g mode default
    bindsym h exec "termite --exec=htop"; mode default
    bindsym Mod4+h exec "termite --exec=htop"; mode default
    bindsym i mode default
    bindsym Mod4+i mode default
    bindsym j exec jetbrains-toolbox; mode default
    bindsym Mod4+j exec jetbrains-toolbox; mode default
    bindsym k mode default
    bindsym Mod4+k mode default
    bindsym l mode default
    bindsym Mod4+l mode default
    bindsym m mode default
    bindsym Mod4+m mode default
    bindsym n mode default
    bindsym Mod4+n mode default
    bindsym o mode default
    bindsym Mod4+o mode default
    bindsym p mode default
    bindsym Mod4+p mode default
    bindsym q mode default
    bindsym Mod4+q mode default
    bindsym r mode default
    bindsym Mod4+r mode default
    bindsym s mode default
    bindsym Mod4+s mode default
    bindsym t exec termite; mode default
    bindsym Mod4+t exec termite; mode default
    bindsym u mode default
    bindsym Mod4+u mode default
    bindsym v exec pavucontrol; mode default
    bindsym Mod4+v exec pavucontrol; mode default
    bindsym w exec "wicd-gtk -n"; mode default
    bindsym Mod4+w exec "wicd-gtk -n"; mode default
    bindsym x mode default
    bindsym Mod4+x mode default
    bindsym y mode default
    bindsym Mod4+y mode default
    bindsym z mode default
    bindsym Mod4+z mode default
}

mode Workspace {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default

    bindsym space exec i3-input -F 'workspace "%s"' -P 'Workspace name: '; mode default
    bindsym Mod4+space exec i3-input -F 'workspace "%s"' -P 'Workspace name: '; mode default

    bindsym 1 workspace 1; mode default
    bindsym Mod4+1 workspace 1; mode default
    bindsym 2 workspace 2; mode default
    bindsym Mod4+2 workspace 2; mode default
    bindsym 3 workspace 3; mode default
    bindsym Mod4+3 workspace 3; mode default
    bindsym 4 workspace 4; mode default
    bindsym Mod4+4 workspace 4; mode default
    bindsym 5 workspace 5; mode default
    bindsym Mod4+5 workspace 5; mode default
    bindsym 6 workspace 6; mode default
    bindsym Mod4+6 workspace 6; mode default
    bindsym 7 workspace 7; mode default
    bindsym Mod4+7 workspace 7; mode default
    bindsym 8 workspace 8; mode default
    bindsym Mod4+8 workspace 8; mode default
    bindsym 9 workspace 9; mode default
    bindsym Mod4+9 workspace 9; mode default
    bindsym 0 workspace 0; mode default
    bindsym Mod4+0 workspace 0; mode default
    bindsym minus workspace Email; mode default
    bindsym Mod4+minus workspace Email; mode default
    bindsym equal workspace Media; mode default
    bindsym Mod4+equal workspace Media; mode default
    bindsym a workspace a; mode default
    bindsym Mod4+a workspace a; mode default
    bindsym b workspace b; mode default
    bindsym Mod4+b workspace b; mode default
    bindsym c workspace c; mode default
    bindsym Mod4+c workspace c; mode default
    bindsym d workspace d; mode default
    bindsym Mod4+d workspace d; mode default
    bindsym e workspace e; mode default
    bindsym Mod4+e workspace e; mode default
    bindsym f workspace f; mode default
    bindsym Mod4+f workspace f; mode default
    bindsym g workspace g; mode default
    bindsym Mod4+g workspace g; mode default
    bindsym h workspace h; mode default
    bindsym Mod4+h workspace h; mode default
    bindsym i workspace i; mode default
    bindsym Mod4+i workspace i; mode default
    bindsym j workspace j; mode default
    bindsym Mod4+j workspace j; mode default
    bindsym k workspace k; mode default
    bindsym Mod4+k workspace k; mode default
    bindsym l workspace l; mode default
    bindsym Mod4+l workspace l; mode default
    bindsym m workspace m; mode default
    bindsym Mod4+m workspace m; mode default
    bindsym n workspace n; mode default
    bindsym Mod4+n workspace n; mode default
    bindsym o workspace o; mode default
    bindsym Mod4+o workspace o; mode default
    bindsym p workspace p; mode default
    bindsym Mod4+p workspace p; mode default
    bindsym q workspace q; mode default
    bindsym Mod4+q workspace q; mode default
    bindsym r workspace r; mode default
    bindsym Mod4+r workspace r; mode default
    bindsym s workspace s; mode default
    bindsym Mod4+s workspace s; mode default
    bindsym t workspace t; mode default
    bindsym Mod4+t workspace t; mode default
    bindsym u workspace u; mode default
    bindsym Mod4+u workspace u; mode default
    bindsym v workspace v; mode default
    bindsym Mod4+v workspace v; mode default
    bindsym w workspace w; mode default
    bindsym Mod4+w workspace w; mode default
    bindsym x workspace x; mode default
    bindsym Mod4+x workspace x; mode default
    bindsym y workspace y; mode default
    bindsym Mod4+y workspace y; mode default
    bindsym z workspace z; mode default
    bindsym Mod4+z workspace z; mode default
}

mode "Move Window" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default

    bindsym space exec i3-input -F 'move container to workspace "%s"' -P 'Destination workspace name: '; mode default
    bindsym Mod4+space exec i3-input -F 'move container to workspace "%s"' -P 'Destination workspace name: '; mode default

    bindsym 1 move container to workspace 1; mode default
    bindsym Mod4+1 move container to workspace 1; mode default
    bindsym 2 move container to workspace 2; mode default
    bindsym Mod4+2 move container to workspace 2; mode default
    bindsym 3 move container to workspace 3; mode default
    bindsym Mod4+3 move container to workspace 3; mode default
    bindsym 4 move container to workspace 4; mode default
    bindsym Mod4+4 move container to workspace 4; mode default
    bindsym 5 move container to workspace 5; mode default
    bindsym Mod4+5 move container to workspace 5; mode default
    bindsym 6 move container to workspace 6; mode default
    bindsym Mod4+6 move container to workspace 6; mode default
    bindsym 7 move container to workspace 7; mode default
    bindsym Mod4+7 move container to workspace 7; mode default
    bindsym 8 move container to workspace 8; mode default
    bindsym Mod4+8 move container to workspace 8; mode default
    bindsym 9 move container to workspace 9; mode default
    bindsym Mod4+9 move container to workspace 9; mode default
    bindsym 0 move container to workspace 0; mode default
    bindsym Mod4+0 move container to workspace 0; mode default
    bindsym minus move container to workspace Email; mode default
    bindsym Mod4+minus move container to workspace Email; mode default
    bindsym equal move container to workspace Media; mode default
    bindsym Mod4+equal move container to workspace Media; mode default
    bindsym a move container to workspace a; mode default
    bindsym Mod4+a move container to workspace a; mode default
    bindsym b move container to workspace b; mode default
    bindsym Mod4+b move container to workspace b; mode default
    bindsym c move container to workspace c; mode default
    bindsym Mod4+c move container to workspace c; mode default
    bindsym d move container to workspace d; mode default
    bindsym Mod4+d move container to workspace d; mode default
    bindsym e move container to workspace e; mode default
    bindsym Mod4+e move container to workspace e; mode default
    bindsym f move container to workspace f; mode default
    bindsym Mod4+f move container to workspace f; mode default
    bindsym g move container to workspace g; mode default
    bindsym Mod4+g move container to workspace g; mode default
    bindsym h move container to workspace h; mode default
    bindsym Mod4+h move container to workspace h; mode default
    bindsym i move container to workspace i; mode default
    bindsym Mod4+i move container to workspace i; mode default
    bindsym j move container to workspace j; mode default
    bindsym Mod4+j move container to workspace j; mode default
    bindsym k move container to workspace k; mode default
    bindsym Mod4+k move container to workspace k; mode default
    bindsym l move container to workspace l; mode default
    bindsym Mod4+l move container to workspace l; mode default
    bindsym m move container to workspace m; mode default
    bindsym Mod4+m move container to workspace m; mode default
    bindsym n move container to workspace n; mode default
    bindsym Mod4+n move container to workspace n; mode default
    bindsym o move container to workspace o; mode default
    bindsym Mod4+o move container to workspace o; mode default
    bindsym p move container to workspace p; mode default
    bindsym Mod4+p move container to workspace p; mode default
    bindsym q move container to workspace q; mode default
    bindsym Mod4+q move container to workspace q; mode default
    bindsym r move container to workspace r; mode default
    bindsym Mod4+r move container to workspace r; mode default
    bindsym s move container to workspace s; mode default
    bindsym Mod4+s move container to workspace s; mode default
    bindsym t move container to workspace t; mode default
    bindsym Mod4+t move container to workspace t; mode default
    bindsym u move container to workspace u; mode default
    bindsym Mod4+u move container to workspace u; mode default
    bindsym v move container to workspace v; mode default
    bindsym Mod4+v move container to workspace v; mode default
    bindsym w move container to workspace w; mode default
    bindsym Mod4+w move container to workspace w; mode default
    bindsym x move container to workspace x; mode default
    bindsym Mod4+x move container to workspace x; mode default
    bindsym y move container to workspace y; mode default
    bindsym Mod4+y move container to workspace y; mode default
    bindsym z move container to workspace z; mode default
    bindsym Mod4+z move container to workspace z; mode default
}

mode "Move and Follow" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default

    bindsym space exec "i3-input -F 'move container to workspace %s; workspace %s' -P 'Destination workspace name: '"; mode default
    bindsym Mod4+space exec "i3-input -F 'move container to workspace %s; workspace %s' -P 'Destination workspace name: '"; mode default

    bindsym 1 move container to workspace 1; workspace 1; mode default
    bindsym Mod4+1 move container to workspace 1; workspace 1; mode default
    bindsym 2 move container to workspace 2; workspace 2; mode default
    bindsym Mod4+2 move container to workspace 2; workspace 2; mode default
    bindsym 3 move container to workspace 3; workspace 3; mode default
    bindsym Mod4+3 move container to workspace 3; workspace 3; mode default
    bindsym 4 move container to workspace 4; workspace 4; mode default
    bindsym Mod4+4 move container to workspace 4; workspace 4; mode default
    bindsym 5 move container to workspace 5; workspace 5; mode default
    bindsym Mod4+5 move container to workspace 5; workspace 5; mode default
    bindsym 6 move container to workspace 6; workspace 6; mode default
    bindsym Mod4+6 move container to workspace 6; workspace 6; mode default
    bindsym 7 move container to workspace 7; workspace 7; mode default
    bindsym Mod4+7 move container to workspace 7; workspace 7; mode default
    bindsym 8 move container to workspace 8; workspace 8; mode default
    bindsym Mod4+8 move container to workspace 8; workspace 8; mode default
    bindsym 9 move container to workspace 9; workspace 9; mode default
    bindsym Mod4+9 move container to workspace 9; workspace 9; mode default
    bindsym 0 move container to workspace 0; workspace 0; mode default
    bindsym Mod4+0 move container to workspace 0; workspace 0; mode default
    bindsym minus move container to workspace Email; workspace Email; mode default
    bindsym Mod4+minus move container to workspace Email; workspace Email; mode default
    bindsym equal move container to workspace Media; workspace Media; mode default
    bindsym Mod4+equal move container to workspace Media; workspace Media; mode default
    bindsym a move container to workspace a; workspace a; mode default
    bindsym Mod4+a move container to workspace a; workspace a; mode default
    bindsym b move container to workspace b; workspace b; mode default
    bindsym Mod4+b move container to workspace b; workspace b; mode default
    bindsym c move container to workspace c; workspace c; mode default
    bindsym Mod4+c move container to workspace c; workspace c; mode default
    bindsym d move container to workspace d; workspace d; mode default
    bindsym Mod4+d move container to workspace d; workspace d; mode default
    bindsym e move container to workspace e; workspace e; mode default
    bindsym Mod4+e move container to workspace e; workspace e; mode default
    bindsym f move container to workspace f; workspace f; mode default
    bindsym Mod4+f move container to workspace f; workspace f; mode default
    bindsym g move container to workspace g; workspace g; mode default
    bindsym Mod4+g move container to workspace g; workspace g; mode default
    bindsym h move container to workspace h; workspace h; mode default
    bindsym Mod4+h move container to workspace h; workspace h; mode default
    bindsym i move container to workspace i; workspace i; mode default
    bindsym Mod4+i move container to workspace i; workspace i; mode default
    bindsym j move container to workspace j; workspace j; mode default
    bindsym Mod4+j move container to workspace j; workspace j; mode default
    bindsym k move container to workspace k; workspace k; mode default
    bindsym Mod4+k move container to workspace k; workspace k; mode default
    bindsym l move container to workspace l; workspace l; mode default
    bindsym Mod4+l move container to workspace l; workspace l; mode default
    bindsym m move container to workspace m; workspace m; mode default
    bindsym Mod4+m move container to workspace m; workspace m; mode default
    bindsym n move container to workspace n; workspace n; mode default
    bindsym Mod4+n move container to workspace n; workspace n; mode default
    bindsym o move container to workspace o; workspace o; mode default
    bindsym Mod4+o move container to workspace o; workspace o; mode default
    bindsym p move container to workspace p; workspace p; mode default
    bindsym Mod4+p move container to workspace p; workspace p; mode default
    bindsym q move container to workspace q; workspace q; mode default
    bindsym Mod4+q move container to workspace q; workspace q; mode default
    bindsym r move container to workspace r; workspace r; mode default
    bindsym Mod4+r move container to workspace r; workspace r; mode default
    bindsym s move container to workspace s; workspace s; mode default
    bindsym Mod4+s move container to workspace s; workspace s; mode default
    bindsym t move container to workspace t; workspace t; mode default
    bindsym Mod4+t move container to workspace t; workspace t; mode default
    bindsym u move container to workspace u; workspace u; mode default
    bindsym Mod4+u move container to workspace u; workspace u; mode default
    bindsym v move container to workspace v; workspace v; mode default
    bindsym Mod4+v move container to workspace v; workspace v; mode default
    bindsym w move container to workspace w; workspace w; mode default
    bindsym Mod4+w move container to workspace w; workspace w; mode default
    bindsym x move container to workspace x; workspace x; mode default
    bindsym Mod4+x move container to workspace x; workspace x; mode default
    bindsym y move container to workspace y; workspace y; mode default
    bindsym Mod4+y move container to workspace y; workspace y; mode default
    bindsym z move container to workspace z; workspace z; mode default
    bindsym Mod4+z move container to workspace z; workspace z; mode default
}

mode "Change Focus" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default

    bindsym Left focus left
    bindsym Mod4+Left focus left
    bindsym Down focus down
    bindsym Mod4+Down focus down
    bindsym Up focus up
    bindsym Mod4+Up focus up
    bindsym Right focus right
    bindsym Mod4+Right focus right
}

mode "Position Window" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default

    bindsym space floating toggle
    bindsym Mod4+space floating toggle

    bindsym Left move left
    bindsym Mod4+Left move left
    bindsym Down move down
    bindsym Mod4+Down move down
    bindsym Up move up
    bindsym Mod4+Up move up
    bindsym Right move right
    bindsym Mod4+Right move right
}
