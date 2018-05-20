################################ Startup ################################

exec_always "feh --bg-fill ~/git/config/img/background.png"

exec_always "compton -b"
exec_always "setxkbmap -layout gb"

# Remap caps lock to middle click
exec_always "sleep 1; /usr/bin/xmodmap -e 'keycode 66 = Pointer_Button2'"

exec_always redshift

############################# Configuration #############################

focus_follows_mouse no

font pango:Roboto 8

floating_modifier Mod4

gaps inner 10
gaps outer -5

smart_gaps true

# Hide windows borders
new_window none
new_float none

################################## Bar ##################################

bar {
    i3bar_command i3bar -t
    status_command i3blocks

    tray_output none
    strip_workspace_numbers yes

    bindsym button3 workspace back_and_forth

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

############################# Window styles #############################

for_window [class="Wicd"] floating enable
for_window [class="Pavucontrol"] floating enable

############################# Key bindings ##############################

bindsym Pointer_Button1 exec "xdotool click 1"
bindsym Pointer_Button2 exec "xdotool click 2"
bindsym Pointer_Button3 exec "xdotool click 3"

bindsym Mod4+F5 reload
bindsym Mod4+F6 restart

bindsym Mod4+F8 exec "bash ~/git/config/scripts/monitorhotplug.sh"

bindsym Mod4+F11 fullscreen toggle

bindsym Print exec "bash ~/git/config/scripts/screenshot.sh"

bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute 0 toggle"

bindsym Mod4+XF86AudioRaiseVolume exec "light | awk '{print int($1*1.1)+1}' | xargs light -S"
bindsym Mod4+XF86AudioLowerVolume exec "light | awk '{print int($1/1.1)}' | xargs light -S"
bindsym XF86MonBrightnessUp exec "light | awk '{print int($1*1.1)+1}' | xargs light -S"
bindsym XF86MonBrightnessDown exec "light | awk '{print int($1/1.1)}' | xargs light -S"

bindsym Mod4+Tab workspace back_and_forth
bindsym Mod4+grave workspace prev
bindsym Mod4+BackSpace workspace next

bindsym Mod4+1 nop
bindsym Mod4+2 nop
bindsym Mod4+3 nop
bindsym Mod4+4 nop
bindsym Mod4+5 nop
bindsym Mod4+6 nop
bindsym Mod4+7 nop
bindsym Mod4+8 nop
bindsym Mod4+9 nop
bindsym Mod4+0 nop
bindsym Mod4+minus nop
bindsym Mod4+equal nop

bindsym Mod4+a nop
bindsym Mod4+b move workspace to output eDP-1
bindsym Mod4+c exec "xdotool click 1 click 1; i3-msg 'fullscreen disable; floating toggle; sticky toggle; resize set 640 px 360 px;'"
bindsym Mod4+d exec "rofi -show drun"
bindsym Mod4+e mode "Execute"
bindsym Mod4+f mode "Change Focus"
bindsym Mod4+g nop
bindsym Mod4+h split h
bindsym Mod4+i exec "i3-input"
bindsym Mod4+j exec "rofi -show window"
bindsym Mod4+k nop
bindsym Mod4+l mode "Lock?"
bindsym Mod4+m mode "Move Window"
bindsym Mod4+n exec i3-input -F 'rename workspace to "%s"' -P 'New name: '
bindsym Mod4+o mode "Move and Follow"
bindsym Mod4+p mode "Position Window"
bindsym Mod4+q mode "Quit?"
bindsym Mod4+r mode "Resize"
bindsym Mod4+s sticky toggle
bindsym Mod4+t mode "Workspace Toggling"
bindsym Mod4+u [urgent="latest"] focus
bindsym Mod4+v split v
bindsym Mod4+w mode "Workspace"
bindsym Mod4+x move workspace to output HDMI-1
bindsym Mod4+y nop
bindsym Mod4+z mode "Enter night mode?"

bindsym Mod4+Return exec "termite"
bindsym Mod4+KP_Enter exec "termite"

bindsym Mod4+Left focus left
bindsym Mod4+Down focus down
bindsym Mod4+Up focus up
bindsym Mod4+Right focus right

bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Up move up
bindsym Mod4+Shift+Right move right

bindsym ISO_Level3_Shift mode "Command"

mode "Command" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym F5 reload
    bindsym F6 restart

    bindsym F8 exec "bash ~/git/config/scripts/monitorhotplug.sh"

    bindsym F11 fullscreen toggle; mode default

    bindsym Tab workspace back_and_forth; mode default
    bindsym grave workspace prev; mode default
    bindsym BackSpace workspace next; mode default

    bindsym 1 nop
    bindsym 2 nop
    bindsym 3 nop
    bindsym 4 nop
    bindsym 5 nop
    bindsym 6 nop
    bindsym 7 nop
    bindsym 8 nop
    bindsym 9 nop
    bindsym 0 nop
    bindsym minus nop
    bindsym equal nop

    bindsym a nop
    bindsym b move workspace to output eDP-1; mode default
    bindsym c exec "xdotool click 1 click 1; i3-msg 'fullscreen disable; floating toggle; sticky toggle; resize set 640 px 360 px;'"; mode default
    bindsym d exec "rofi -show drun"; mode default
    bindsym e mode "Execute"
    bindsym f mode "Change Focus"
    bindsym g nop
    bindsym h split h; mode default
    bindsym i exec "i3-input"; mode default
    bindsym j exec "rofi -show window"; mode default
    bindsym k nop
    bindsym l mode "Lock?"
    bindsym m mode "Move Window"
    bindsym n exec i3-input -F 'rename workspace to "%s"' -P 'New name: '; mode default
    bindsym o mode "Move and Follow"
    bindsym p mode "Position Window"
    bindsym q mode "Quit?"
    bindsym r mode "Resize"
    bindsym s sticky toggle; mode default
    bindsym t mode "Workspace Toggling"
    bindsym u [urgent="latest"] focus; mode default
    bindsym v split v; mode default
    bindsym w mode "Workspace"
    bindsym x move workspace to output HDMI-1; mode default
    bindsym y nop
    bindsym z mode "Enter night mode?"

    bindsym Return exec "termite"; mode default
    bindsym KP_Enter exec "termite"; mode default

    bindsym Left focus left; mode default
    bindsym Down focus down; mode default
    bindsym Up focus up; mode default
    bindsym Right focus right; mode default

    bindsym Shift+Left move left; mode default
    bindsym Shift+Down move down; mode default
    bindsym Shift+Up move up; mode default
    bindsym Shift+Right move right; mode default

    bindsym XF86AudioRaiseVolume exec "light | awk '{print int($1*1.1)+1}' | xargs light -S"
    bindsym XF86AudioLowerVolume exec "light | awk '{print int($1/1.1)}' | xargs light -S"
}

mode "Execute" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym Return exec "termite"; mode default
    bindsym Mod4+Return exec "termite"; mode default
    bindsym KP_Enter exec "termite"; mode default
    bindsym Mod4+KP_Enter exec "termite"; mode default

    bindsym a exec "atom"; mode default
    bindsym Mod4+a exec "atom"; mode default
    bindsym b exec "chromium"; mode default
    bindsym Mod4+b exec "chromium"; mode default
    bindsym c mode default
    bindsym Mod4+c mode default
    bindsym d mode default
    bindsym Mod4+d mode default
    bindsym e exec "google-earth"; mode default
    bindsym Mod4+e exec "google-earth"; mode default
    bindsym f exec "firefox"; mode default
    bindsym Mod4+f exec "firefox"; mode default
    bindsym g exec "gimp"; mode default
    bindsym Mod4+g exec "gimp"; mode default
    bindsym h exec "termite --exec='sudo htop'"; mode default
    bindsym Mod4+h exec "termite --exec='sudo htop'"; mode default
    bindsym i mode default
    bindsym Mod4+i mode default
    bindsym j exec "jetbrains-toolbox"; mode default
    bindsym Mod4+j exec "jetbrains-toolbox"; mode default
    bindsym k mode default
    bindsym Mod4+k mode default
    bindsym l exec "libreoffice"; mode default
    bindsym Mod4+l exec "libreoffice"; mode default
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
    bindsym t exec "tor-browser"; mode default
    bindsym Mod4+t exec "tor-browser"; mode default
    bindsym u mode default
    bindsym Mod4+u mode default
    bindsym v exec "pavucontrol"; mode default
    bindsym Mod4+v exec "pavucontrol"; mode default
    bindsym w exec "wicd-gtk -n"; mode default
    bindsym Mod4+w exec "wicd-gtk -n"; mode default
    bindsym x exec "xarchiver"; mode default
    bindsym Mod4+x exec "xarchiver"; mode default
    bindsym y mode default
    bindsym Mod4+y mode default
    bindsym z mode default
    bindsym Mod4+z mode default
}

mode "Workspace" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym space exec i3-input -F 'workspace "%s"' -P 'Workspace name: '; mode default
    bindsym Mod4+space exec i3-input -F 'workspace "%s"' -P 'Workspace name: '; mode default

    bindsym Tab workspace back_and_forth
    bindsym Mod4+Tab workspace back_and_forth
    bindsym grave workspace prev
    bindsym Mod4+grave workspace prev
    bindsym BackSpace workspace next
    bindsym Mod4+BackSpace workspace next

    bindsym minus workspace 98:Email; mode default
    bindsym Mod4+minus workspace 98:Email; mode default
    bindsym equal workspace 99:Media; mode default
    bindsym Mod4+equal workspace 99:Media; mode default

    bindsym 0 workspace 0; mode default
    bindsym Mod4+0 workspace 0; mode default
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

    bindsym a workspace 10:A; mode default
    bindsym Mod4+a workspace 10:A; mode default
    bindsym b workspace 11:B; mode default
    bindsym Mod4+b workspace 11:B; mode default
    bindsym c workspace 12:C; mode default
    bindsym Mod4+c workspace 12:C; mode default
    bindsym d workspace 13:D; mode default
    bindsym Mod4+d workspace 13:D; mode default
    bindsym e workspace 14:E; mode default
    bindsym Mod4+e workspace 14:E; mode default
    bindsym f workspace 15:F; mode default
    bindsym Mod4+f workspace 15:F; mode default
    bindsym g workspace 16:G; mode default
    bindsym Mod4+g workspace 16:G; mode default
    bindsym h workspace 17:H; mode default
    bindsym Mod4+h workspace 17:H; mode default
    bindsym i workspace 18:I; mode default
    bindsym Mod4+i workspace 18:I; mode default
    bindsym j workspace 19:J; mode default
    bindsym Mod4+j workspace 19:J; mode default
    bindsym k workspace 20:K; mode default
    bindsym Mod4+k workspace 20:K; mode default
    bindsym l workspace 21:L; mode default
    bindsym Mod4+l workspace 21:L; mode default
    bindsym m workspace 22:M; mode default
    bindsym Mod4+m workspace 22:M; mode default
    bindsym n workspace 23:N; mode default
    bindsym Mod4+n workspace 23:N; mode default
    bindsym o workspace 24:O; mode default
    bindsym Mod4+o workspace 24:O; mode default
    bindsym p workspace 25:P; mode default
    bindsym Mod4+p workspace 25:P; mode default
    bindsym q workspace 26:Q; mode default
    bindsym Mod4+q workspace 26:Q; mode default
    bindsym r workspace 27:R; mode default
    bindsym Mod4+r workspace 27:R; mode default
    bindsym s workspace 28:S; mode default
    bindsym Mod4+s workspace 28:S; mode default
    bindsym t workspace 29:T; mode default
    bindsym Mod4+t workspace 29:T; mode default
    bindsym u workspace 30:U; mode default
    bindsym Mod4+u workspace 30:U; mode default
    bindsym v workspace 31:V; mode default
    bindsym Mod4+v workspace 31:V; mode default
    bindsym w workspace 32:W; mode default
    bindsym Mod4+w workspace 32:W; mode default
    bindsym x workspace 33:X; mode default
    bindsym Mod4+x workspace 33:X; mode default
    bindsym y workspace 34:Y; mode default
    bindsym Mod4+y workspace 34:Y; mode default
    bindsym z workspace 35:Z; mode default
    bindsym Mod4+z workspace 35:Z; mode default
}

mode "Move Window" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym space exec i3-input -F 'move container to workspace "%s"' -P 'Destination workspace name: '; mode default
    bindsym Mod4+space exec i3-input -F 'move container to workspace "%s"' -P 'Destination workspace name: '; mode default

    bindsym minus move container to workspace 98:Email; mode default
    bindsym Mod4+minus move container to workspace 98:Email; mode default
    bindsym equal move container to workspace 99:Media; mode default
    bindsym Mod4+equal move container to workspace 99:Media; mode default

    bindsym 0 move container to workspace 0; mode default
    bindsym Mod4+0 move container to workspace 0; mode default
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

    bindsym a move container to workspace 10:A; mode default
    bindsym Mod4+a move container to workspace 10:A; mode default
    bindsym b move container to workspace 11:B; mode default
    bindsym Mod4+b move container to workspace 11:B; mode default
    bindsym c move container to workspace 12:C; mode default
    bindsym Mod4+c move container to workspace 12:C; mode default
    bindsym d move container to workspace 13:D; mode default
    bindsym Mod4+d move container to workspace 13:D; mode default
    bindsym e move container to workspace 14:E; mode default
    bindsym Mod4+e move container to workspace 14:E; mode default
    bindsym f move container to workspace 15:F; mode default
    bindsym Mod4+f move container to workspace 15:F; mode default
    bindsym g move container to workspace 16:G; mode default
    bindsym Mod4+g move container to workspace 16:G; mode default
    bindsym h move container to workspace 17:H; mode default
    bindsym Mod4+h move container to workspace 17:H; mode default
    bindsym i move container to workspace 18:I; mode default
    bindsym Mod4+i move container to workspace 18:I; mode default
    bindsym j move container to workspace 19:J; mode default
    bindsym Mod4+j move container to workspace 19:J; mode default
    bindsym k move container to workspace 20:K; mode default
    bindsym Mod4+k move container to workspace 20:K; mode default
    bindsym l move container to workspace 21:L; mode default
    bindsym Mod4+l move container to workspace 21:L; mode default
    bindsym m move container to workspace 22:M; mode default
    bindsym Mod4+m move container to workspace 22:M; mode default
    bindsym n move container to workspace 23:N; mode default
    bindsym Mod4+n move container to workspace 23:N; mode default
    bindsym o move container to workspace 24:O; mode default
    bindsym Mod4+o move container to workspace 24:O; mode default
    bindsym p move container to workspace 25:P; mode default
    bindsym Mod4+p move container to workspace 25:P; mode default
    bindsym q move container to workspace 26:Q; mode default
    bindsym Mod4+q move container to workspace 26:Q; mode default
    bindsym r move container to workspace 27:R; mode default
    bindsym Mod4+r move container to workspace 27:R; mode default
    bindsym s move container to workspace 28:S; mode default
    bindsym Mod4+s move container to workspace 28:S; mode default
    bindsym t move container to workspace 29:T; mode default
    bindsym Mod4+t move container to workspace 29:T; mode default
    bindsym u move container to workspace 30:U; mode default
    bindsym Mod4+u move container to workspace 30:U; mode default
    bindsym v move container to workspace 31:V; mode default
    bindsym Mod4+v move container to workspace 31:V; mode default
    bindsym w move container to workspace 32:W; mode default
    bindsym Mod4+w move container to workspace 32:W; mode default
    bindsym x move container to workspace 33:X; mode default
    bindsym Mod4+x move container to workspace 33:X; mode default
    bindsym y move container to workspace 34:Y; mode default
    bindsym Mod4+y move container to workspace 34:Y; mode default
    bindsym z move container to workspace 35:Z; mode default
    bindsym Mod4+z move container to workspace 35:Z; mode default
}

mode "Move and Follow" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym space exec "i3-input -F 'move container to workspace %s; workspace %s' -P 'Destination workspace name: '"; mode default
    bindsym Mod4+space exec "i3-input -F 'move container to workspace %s; workspace %s' -P 'Destination workspace name: '"; mode default

    bindsym minus move container to workspace 98:Email; workspace 98:Email; mode default
    bindsym Mod4+minus move container to workspace 98:Email; workspace 98:Email; mode default
    bindsym equal move container to workspace 99:Media; workspace 99:Media; mode default
    bindsym Mod4+equal move container to workspace 99:Media; workspace 99:Media; mode default

    bindsym 0 move container to workspace 0; workspace 0; mode default
    bindsym Mod4+0 move container to workspace 0; workspace 0; mode default
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

    bindsym a move container to workspace 10:A; workspace 10:A; mode default
    bindsym Mod4+a move container to workspace 10:A; workspace 10:A; mode default
    bindsym b move container to workspace 11:B; workspace 11:B; mode default
    bindsym Mod4+b move container to workspace 11:B; workspace 11:B; mode default
    bindsym c move container to workspace 12:C; workspace 12:C; mode default
    bindsym Mod4+c move container to workspace 12:C; workspace 12:C; mode default
    bindsym d move container to workspace 13:D; workspace 13:D; mode default
    bindsym Mod4+d move container to workspace 13:D; workspace 13:D; mode default
    bindsym e move container to workspace 14:E; workspace 14:E; mode default
    bindsym Mod4+e move container to workspace 14:E; workspace 14:E; mode default
    bindsym f move container to workspace 15:F; workspace 15:F; mode default
    bindsym Mod4+f move container to workspace 15:F; workspace 15:F; mode default
    bindsym g move container to workspace 16:G; workspace 16:G; mode default
    bindsym Mod4+g move container to workspace 16:G; workspace 16:G; mode default
    bindsym h move container to workspace 17:H; workspace 17:H; mode default
    bindsym Mod4+h move container to workspace 17:H; workspace 17:H; mode default
    bindsym i move container to workspace 18:I; workspace 18:I; mode default
    bindsym Mod4+i move container to workspace 18:I; workspace 18:I; mode default
    bindsym j move container to workspace 19:J; workspace 19:J; mode default
    bindsym Mod4+j move container to workspace 19:J; workspace 19:J; mode default
    bindsym k move container to workspace 20:K; workspace 20:K; mode default
    bindsym Mod4+k move container to workspace 20:K; workspace 20:K; mode default
    bindsym l move container to workspace 21:L; workspace 21:L; mode default
    bindsym Mod4+l move container to workspace 21:L; workspace 21:L; mode default
    bindsym m move container to workspace 22:M; workspace 22:M; mode default
    bindsym Mod4+m move container to workspace 22:M; workspace 22:M; mode default
    bindsym n move container to workspace 23:N; workspace 23:N; mode default
    bindsym Mod4+n move container to workspace 23:N; workspace 23:N; mode default
    bindsym o move container to workspace 24:O; workspace 24:O; mode default
    bindsym Mod4+o move container to workspace 24:O; workspace 24:O; mode default
    bindsym p move container to workspace 25:P; workspace 25:P; mode default
    bindsym Mod4+p move container to workspace 25:P; workspace 25:P; mode default
    bindsym q move container to workspace 26:Q; workspace 26:Q; mode default
    bindsym Mod4+q move container to workspace 26:Q; workspace 26:Q; mode default
    bindsym r move container to workspace 27:R; workspace 27:R; mode default
    bindsym Mod4+r move container to workspace 27:R; workspace 27:R; mode default
    bindsym s move container to workspace 28:S; workspace 28:S; mode default
    bindsym Mod4+s move container to workspace 28:S; workspace 28:S; mode default
    bindsym t move container to workspace 29:T; workspace 29:T; mode default
    bindsym Mod4+t move container to workspace 29:T; workspace 29:T; mode default
    bindsym u move container to workspace 30:U; workspace 30:U; mode default
    bindsym Mod4+u move container to workspace 30:U; workspace 30:U; mode default
    bindsym v move container to workspace 31:V; workspace 31:V; mode default
    bindsym Mod4+v move container to workspace 31:V; workspace 31:V; mode default
    bindsym w move container to workspace 32:W; workspace 32:W; mode default
    bindsym Mod4+w move container to workspace 32:W; workspace 32:W; mode default
    bindsym x move container to workspace 33:X; workspace 33:X; mode default
    bindsym Mod4+x move container to workspace 33:X; workspace 33:X; mode default
    bindsym y move container to workspace 34:Y; workspace 34:Y; mode default
    bindsym Mod4+y move container to workspace 34:Y; workspace 34:Y; mode default
    bindsym z move container to workspace 35:Z; workspace 35:Z; mode default
    bindsym Mod4+z move container to workspace 35:Z; workspace 35:Z; mode default
}

mode "Workspace Toggling" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym r exec "python3 ~/git/config/scripts/workspace_record.py"
    bindsym Mod4+r exec "python3 ~/git/config/scripts/workspace_record.py"

    bindsym a exec i3-input -F 'exec "python3 ~/git/config/scripts/workspace_animate.py %s"' -P 'Animation interval: '
    bindsym Mod4+a exec i3-input -F 'exec "python3 ~/git/config/scripts/workspace_animate.py %s"' -P 'Animation interval: '

    bindsym t exec "bash ~/git/config/scripts/workspace_cycle.sh"; mode default
    bindsym Mod4+t exec "bash ~/git/config/scripts/workspace_cycle.sh"; mode default
    bindsym space exec "bash ~/git/config/scripts/workspace_cycle.sh"
    bindsym Mod4+space exec "bash ~/git/config/scripts/workspace_cycle.sh"
}

mode "Workspace Animate" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default
}

mode "Workspace Record" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift nop
    bindsym Mod4+ISO_Level3_Shift nop

    bindsym space exec i3-input -F 'workspace "%s"' -P 'Workspace name: '
    bindsym Mod4+space exec i3-input -F 'workspace "%s"' -P 'Workspace name: '

    bindsym Tab workspace back_and_forth
    bindsym Mod4+Tab workspace back_and_forth
    bindsym grave workspace prev
    bindsym Mod4+grave workspace prev
    bindsym BackSpace workspace next
    bindsym Mod4+BackSpace workspace next

    bindsym minus workspace 98:Email
    bindsym Mod4+minus workspace 98:Email
    bindsym equal workspace 99:Media
    bindsym Mod4+equal workspace 99:Media

    bindsym 0 workspace 0
    bindsym Mod4+0 workspace 0
    bindsym 1 workspace 1
    bindsym Mod4+1 workspace 1
    bindsym 2 workspace 2
    bindsym Mod4+2 workspace 2
    bindsym 3 workspace 3
    bindsym Mod4+3 workspace 3
    bindsym 4 workspace 4
    bindsym Mod4+4 workspace 4
    bindsym 5 workspace 5
    bindsym Mod4+5 workspace 5
    bindsym 6 workspace 6
    bindsym Mod4+6 workspace 6
    bindsym 7 workspace 7
    bindsym Mod4+7 workspace 7
    bindsym 8 workspace 8
    bindsym Mod4+8 workspace 8
    bindsym 9 workspace 9
    bindsym Mod4+9 workspace 9

    bindsym a workspace 10:A
    bindsym Mod4+a workspace 10:A
    bindsym b workspace 11:B
    bindsym Mod4+b workspace 11:B
    bindsym c workspace 12:C
    bindsym Mod4+c workspace 12:C
    bindsym d workspace 13:D
    bindsym Mod4+d workspace 13:D
    bindsym e workspace 14:E
    bindsym Mod4+e workspace 14:E
    bindsym f workspace 15:F
    bindsym Mod4+f workspace 15:F
    bindsym g workspace 16:G
    bindsym Mod4+g workspace 16:G
    bindsym h workspace 17:H
    bindsym Mod4+h workspace 17:H
    bindsym i workspace 18:I
    bindsym Mod4+i workspace 18:I
    bindsym j workspace 19:J
    bindsym Mod4+j workspace 19:J
    bindsym k workspace 20:K
    bindsym Mod4+k workspace 20:K
    bindsym l workspace 21:L
    bindsym Mod4+l workspace 21:L
    bindsym m workspace 22:M
    bindsym Mod4+m workspace 22:M
    bindsym n workspace 23:N
    bindsym Mod4+n workspace 23:N
    bindsym o workspace 24:O
    bindsym Mod4+o workspace 24:O
    bindsym p workspace 25:P
    bindsym Mod4+p workspace 25:P
    bindsym q workspace 26:Q
    bindsym Mod4+q workspace 26:Q
    bindsym r workspace 27:R
    bindsym Mod4+r workspace 27:R
    bindsym s workspace 28:S
    bindsym Mod4+s workspace 28:S
    bindsym t workspace 29:T
    bindsym Mod4+t workspace 29:T
    bindsym u workspace 30:U
    bindsym Mod4+u workspace 30:U
    bindsym v workspace 31:V
    bindsym Mod4+v workspace 31:V
    bindsym w workspace 32:W
    bindsym Mod4+w workspace 32:W
    bindsym x workspace 33:X
    bindsym Mod4+x workspace 33:X
    bindsym y workspace 34:Y
    bindsym Mod4+y workspace 34:Y
    bindsym z workspace 35:Z
    bindsym Mod4+z workspace 35:Z
}

mode "Change Focus" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym Left focus left
    bindsym Mod4+Left focus left
    bindsym Down focus down
    bindsym Mod4+Down focus down
    bindsym Up focus up
    bindsym Mod4+Up focus up
    bindsym Right focus right
    bindsym Mod4+Right focus right

    bindsym p focus parent
    bindsym Mod4+p focus parent
    bindsym p focus child
    bindsym Mod4+p focus child

    bindsym f focus floating
    bindsym Mod4+f focus floating
    bindsym t focus tiling
    bindsym Mod4+t focus tiling
}

mode "Position Window" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym Left move left
    bindsym Mod4+Left move left
    bindsym Down move down
    bindsym Mod4+Down move down
    bindsym Up move up
    bindsym Mod4+Up move up
    bindsym Right move right
    bindsym Mod4+Right move right

    bindsym space floating toggle; mode default
    bindsym Mod4+space floating toggle; mode default

    bindsym f floating enable
    bindsym Mod4+f floating enable
    bindsym t floating disable
    bindsym Mod4+t floating disable

    bindsym c move position center; mode default
    bindsym Mod4+c move position center; mode default
    bindsym m move position mouse; mode default
    bindsym Mod4+m move position mouse; mode default
}

mode "Resize" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym F mode "Resize (Fast)"
    bindsym Mod4+F mode "Resize (Fast)"
    bindsym N mode "Resize"
    bindsym Mod4+N mode "Resize"
    bindsym R mode "Resize"
    bindsym Mod4+R mode "Resize"
    bindsym S mode "Resize (Slow)"
    bindsym Mod4+S mode "Resize (Slow)"

    bindsym Left       resize shrink width  10 px or 2 ppt
    bindsym Mod4+Left  resize shrink width  10 px or 2 ppt
    bindsym Up         resize grow   height 10 px or 2 ppt
    bindsym Mod4+Up    resize grow   height 10 px or 2 ppt
    bindsym Down       resize shrink height 10 px or 2 ppt
    bindsym Mod4+Down  resize shrink height 10 px or 2 ppt
    bindsym Right      resize grow   width  10 px or 2 ppt
    bindsym Mod4+Right resize grow   width  10 px or 2 ppt
}

mode "Resize (Slow)" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym F mode "Resize (Fast)"
    bindsym Mod4+F mode "Resize (Fast)"
    bindsym N mode "Resize"
    bindsym Mod4+N mode "Resize"
    bindsym R mode "Resize"
    bindsym Mod4+R mode "Resize"
    bindsym S mode "Resize"
    bindsym Mod4+S mode "Resize"

    bindsym Left       resize shrink width  1 px or 1 ppt
    bindsym Mod4+Left  resize shrink width  1 px or 1 ppt
    bindsym Up         resize grow   height 1 px or 1 ppt
    bindsym Mod4+Up    resize grow   height 1 px or 1 ppt
    bindsym Down       resize shrink height 1 px or 1 ppt
    bindsym Mod4+Down  resize shrink height 1 px or 1 ppt
    bindsym Right      resize grow   width  1 px or 1 ppt
    bindsym Mod4+Right resize grow   width  1 px or 1 ppt
}

mode "Resize (Fast)" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym F mode "Resize"
    bindsym Mod4+F mode "Resize"
    bindsym N mode "Resize"
    bindsym Mod4+N mode "Resize"
    bindsym R mode "Resize"
    bindsym Mod4+R mode "Resize"
    bindsym S mode "Resize (Slow)"
    bindsym Mod4+S mode "Resize (Slow)"

    bindsym Left       resize shrink width  50 px or 5 ppt
    bindsym Mod4+Left  resize shrink width  50 px or 5 ppt
    bindsym Up         resize grow   height 50 px or 5 ppt
    bindsym Mod4+Up    resize grow   height 50 px or 5 ppt
    bindsym Down       resize shrink height 50 px or 5 ppt
    bindsym Mod4+Down  resize shrink height 50 px or 5 ppt
    bindsym Right      resize grow   width  50 px or 5 ppt
    bindsym Mod4+Right resize grow   width  50 px or 5 ppt
}

mode "Quit?" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym q kill; mode default
    bindsym Mod4+q kill; mode default

    bindsym k exec "termite --exec=xkill"; mode default
    bindsym Mod4+k exec "termite -exec=xkill"; mode default

    bindsym m kill
    bindsym Mod4+m kill

    bindsym Tab workspace back_and_forth
    bindsym Mod4+Tab workspace back_and_forth
    bindsym grave workspace prev
    bindsym Mod4+grave workspace prev
    bindsym BackSpace workspace next
    bindsym Mod4+BackSpace workspace next
}

mode "Lock?" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym l exec "i3lock -feti ~/git/config/img/lock.png -c 404040"; mode default
    bindsym Mod4+l exec "i3lock -feti ~/git/config/img/lock.png -c 404040"; mode default

    bindsym b exec "bash ~/git/config/scripts/blank.sh --blank"
    bindsym Mod4+b exec "bash ~/git/config/scripts/blank.sh --blank"

    bindsym s exec "systemctl suspend"; mode default;
    bindsym Mod4+s exec "systemctl suspend"; mode default;
}

mode "Blank" {
    bindsym Escape exec "bash ~/git/config/scripts/blank.sh --show"

    bindsym b exec "bash ~/git/config/scripts/blank.sh --show"
    bindsym Mod4+b exec "bash ~/git/config/scripts/blank.sh --show"
}

mode "Enter night mode?" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym z exec "bash ~/git/config/scripts/night.sh --night"
    bindsym Mod4+z exec "bash ~/git/config/scripts/night.sh --night"
}

mode "Night" {
    bindsym Escape exec "bash ~/git/config/scripts/night.sh --day"

    bindsym space exec "bash ~/git/config/scripts/night.sh --black"

    bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +1%"
    bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -1%"

    bindsym --whole-window button4 exec "pactl set-sink-volume 0 +1%"
    bindsym --whole-window button5 exec "pactl set-sink-volume 0 -1%"
}

mode "Night (Black)" {
    bindsym Escape exec "bash ~/git/config/scripts/night.sh --day"

    bindsym space exec "bash ~/git/config/scripts/night.sh --night"

    bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +1%"
    bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -1%"

    bindsym --whole-window button4 exec "pactl set-sink-volume 0 +1%"
    bindsym --whole-window button5 exec "pactl set-sink-volume 0 -1%"
}
