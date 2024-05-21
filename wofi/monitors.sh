#!/usr/bin/env bash
op=$( echo -e "󱒃  Extend\n󰍺  Duplicate\n󱘖  Reconnect\n󰶐  Disconnect" | wofi  --width 250 --height 220 -i --dmenu --prompt "Power" --normal_window true| awk '{print tolower($2)}' )


case $op in 
        extend)
                xrandr --output HDMI-A-2 --right-of eDP-1
                ;;
        duplicate)
				xrandr --output HDMI-A-2 --off
				sleep 2
				xrandr --output HDMI-A-2 --auto
                ;;
        reconnect)
				xrandr --output HDMI-A-2 --auto
                ;;
        disconnect)
				xrandr --output HDMI-A-2 --off
                ;;
esac
