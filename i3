################################ Startup ################################

exec_always "feh --bg-fill ~/git/config/img/background.jpg"

exec_always "setxkbmap -layout gb"
# Remap caps lock to middle click
exec_always "sleep 3; /usr/bin/xmodmap -e 'keycode 66 = Pointer_Button2'"

exec_always "pkill picom; sleep .1; pkill -SIGTERM picom; picom -b"
exec_always "pkill -SIGKILL redshift; redshift -P"

############################# Configuration #############################

font pango:Roboto 8

floating_modifier Mod4
focus_follows_mouse no

gaps inner 10
gaps outer -2

# Hide windows borders
default_border          pixel
default_floating_border pixel

client.focused          #87A3A3 #255656 #FFFFFF #87A3A3   #87A3A3
client.focused_inactive #4B7979 #255656 #87A3A3 #255656   #255656
client.unfocused        #255656 #053333 #87A3A3 #053333   #053333
client.urgent           #903E3E #550808 #FFFAFA #903E3E   #903E3E
client.placeholder      #000000 #000000 #7F7F7F #000000   #000000
client.background       #EBF0F0

################################## Bar ##################################

bar {
    i3bar_command i3bar -t
    status_command i3blocks

    tray_output none
    strip_workspace_numbers yes

    bindsym button3 workspace back_and_forth

    colors {
        background #053333
        statusline #FFFFFF
        separator  #666666

        focused_workspace  #87A3A3 #4B7979 #FFFFFF
        active_workspace   #87A3A3 #255656 #EBF0F0
        inactive_workspace #4B7979 #255656 #EBF0F0
        urgent_workspace   #CA7C7C #903E3E #FFFAFA
        binding_mode       #CAB07C #90753E #FFFDFA
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

bindsym Mod4+F7 exec "bash ~/git/config/scripts/monitorhotplug.sh"

bindsym Mod4+F11 fullscreen toggle

bindsym Print exec "bash ~/git/config/scripts/screenshot.sh"

bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute 0 toggle"

bindsym Mod4+XF86AudioRaiseVolume exec "light | awk '{print int($1*1.1)+1}' | xargs light -S"
bindsym Mod4+XF86AudioLowerVolume exec "light | awk '{print int($1/1.1)}' | xargs light -S"
bindsym XF86MonBrightnessUp exec "light | awk '{print int($1*1.1)+1}' | xargs light -S"
bindsym XF86MonBrightnessDown exec "light | awk '{print int($1/1.1)}' | xargs light -S"

bindsym Mod4+grave workspace prev
bindsym Mod4+BackSpace workspace next

bindsym Mod4+Tab workspace back_and_forth

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
bindsym Mod4+t layout toggle tabbed split
bindsym Mod4+u [urgent="latest"] focus
bindsym Mod4+v split v
bindsym Mod4+w mode "Workspace"
bindsym Mod4+x move workspace to output HDMI-2
bindsym Mod4+y nop
bindsym Mod4+z mode "Enter night mode?"

bindsym Mod4+Return exec "alacritty"
bindsym Mod4+KP_Enter exec "alacritty"

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

    bindsym F7 exec "bash ~/git/config/scripts/monitorhotplug.sh"

    bindsym F11 fullscreen toggle; mode default

    bindsym grave workspace prev; mode default
    bindsym BackSpace workspace next; mode default

    bindsym Tab workspace back_and_forth

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
    bindsym t layout toggle tabbed split
    bindsym u [urgent="latest"] focus; mode default
    bindsym v split v; mode default
    bindsym w mode "Workspace"
    bindsym x move workspace to output HDMI-2; mode default
    bindsym y nop
    bindsym z mode "Enter night mode?"

    bindsym Return exec "alacritty"; mode default
    bindsym KP_Enter exec "alacritty"; mode default

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

    bindsym Return exec "alacritty"; mode default
    bindsym Mod4+Return exec "alacritty"; mode default
    bindsym KP_Enter exec "alacritty"; mode default
    bindsym Mod4+KP_Enter exec "alacritty"; mode default

    bindsym a mode default
    bindsym Mod4+a mode default
    bindsym b exec "chromium"; mode default
    bindsym Mod4+b exec "chromium"; mode default
    bindsym c exec "code -n"; mode default
    bindsym Mod4+c exec "code -n"; mode default
    bindsym d mode default
    bindsym Mod4+d mode default
    bindsym e exec "google-earth"; mode default
    bindsym Mod4+e exec "google-earth"; mode default
    bindsym f exec "firefox"; mode default
    bindsym Mod4+f exec "firefox"; mode default
    bindsym g exec "gimp"; mode default
    bindsym Mod4+g exec "gimp"; mode default
    bindsym h exec "alacritty --command sudo nice -n -19 htop"; mode default
    bindsym Mod4+h exec "alacritty --command sudo nice -n -19 htop"; mode default
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
    bindsym q exec "qgis"; mode default
    bindsym Mod4+q exec "qgis"; mode default
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
    bindsym w exec "nm-connection-editor"; mode default
    bindsym Mod4+w exec "nm-connection-editor"; mode default
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

mode "Toggle" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default
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

    bindsym R mode "Resize"
    bindsym Mod4+R mode "Resize"

    bindsym F mode "Position Window (Fast)"
    bindsym Mod4+F mode "Position Window (Fast)"
    bindsym N mode "Position Window"
    bindsym Mod4+N mode "Position Window"
    bindsym S mode "Position Window (Slow)"
    bindsym Mod4+S mode "Position Window (Slow)"

    bindsym Left move left 10px
    bindsym Mod4+Left move left 10px
    bindsym Down move down 10px
    bindsym Mod4+Down move down 10px
    bindsym Up move up 10px
    bindsym Mod4+Up move up 10px
    bindsym Right move right 10px
    bindsym Mod4+Right move right 10px

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

mode "Position Window (Slow)" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym R mode "Resize"
    bindsym Mod4+R mode "Resize"

    bindsym F mode "Position Window (Fast)"
    bindsym Mod4+F mode "Position Window (Fast)"
    bindsym N mode "Position Window"
    bindsym Mod4+N mode "Position Window"
    bindsym S mode "Position Window"
    bindsym Mod4+S mode "Position Window"

    bindsym Left move left 1px
    bindsym Mod4+Left move left 1px
    bindsym Down move down 1px
    bindsym Mod4+Down move down 1px
    bindsym Up move up 1px
    bindsym Mod4+Up move up 1px
    bindsym Right move right 1px
    bindsym Mod4+Right move right 1px

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

mode "Position Window (Fast)" {
    bindsym Escape mode default
    bindsym Mod4+Escape mode default
    bindsym ISO_Level3_Shift mode default
    bindsym Mod4+ISO_Level3_Shift mode default

    bindsym R mode "Resize"
    bindsym Mod4+R mode "Resize"

    bindsym F mode "Position Window"
    bindsym Mod4+F mode "Position Window"
    bindsym N mode "Position Window"
    bindsym Mod4+N mode "Position Window"
    bindsym S mode "Position Window (Slow)"
    bindsym Mod4+S mode "Position Window (Slow)"

    bindsym Left move left 50px
    bindsym Mod4+Left move left 50px
    bindsym Down move down 50px
    bindsym Mod4+Down move down 50px
    bindsym Up move up 50px
    bindsym Mod4+Up move up 50px
    bindsym Right move right 50px
    bindsym Mod4+Right move right 50px

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

    bindsym P mode "Position Window"
    bindsym Mod4+P mode "Position Window"

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

    bindsym P mode "Position Window"
    bindsym Mod4+P mode "Position Window"

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

    bindsym P mode "Position Window"
    bindsym Mod4+P mode "Position Window"

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

    bindsym k exec "alacritty --command xkill"; mode default
    bindsym Mod4+k exec "alacritty --command xkill"; mode default

    bindsym m kill
    bindsym Mod4+m kill

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

    bindsym l exec "bash ~/git/config/scripts/lock.sh"; mode default
    bindsym Mod4+l exec "bash ~/git/config/scripts/lock.sh"; mode default

    bindsym b exec "xset dpms force off"; mode default
    bindsym Mod4+b exec "sleep 1; xset dpms force off"; mode default

    bindsym s exec "systemctl suspend"; mode default;
    bindsym Mod4+s exec "systemctl suspend"; mode default;
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
