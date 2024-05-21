#!/usr/bin/env bash
op=$( echo -e "  Lock\n Sleep\n  Logout\n Reboot\n  Poweroff" | wofi  --width 250 --height 220 -i --dmenu --prompt "Power" --normal_window true| awk '{print tolower($2)}' )

case $op in 
        poweroff)
                systemctl poweroff
                ;;
        sleep)
                 swaylock -C ~/.config/swaylock/config
                 systemctl suspend
                ;;
        lock)
		swaylock -C ~/.config/swaylock/config
                ;;
        logout)
                hyprctl dispatch exit
                ;;
        reboot)
                systemctl reboot
                ;;
esac
