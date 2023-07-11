#!/usr/bin/env bash


dir="~/.config/polybar/scripts/rofi"
uptime=$(xrandr | grep -w "connected" | awk '{if (NR==1) {printf $1} else {printf ", " $1}} END {print ""}')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
extend="󱒃  Extend"
duplicate="󰍺  Duplicate"
reconnect="󱘖  Reconnect"
disconnect="󰶐  Disconnect"

# Confirmation
	confirm_exit() {
		rofi -dmenu\
			-i\
			-no-fixed-num-lines\
			-p "Are You Sure? : "\
			-theme $dir/confirm.rasi
	}

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$extend\n$duplicate\n$reconnect\n$disconnect"

chosen="$(echo -e "$options" | $rofi_command -p "Available: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $extend)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			xrandr --output HDMI1 --right-of eDP1
			sh ~/.config/polybar/bar.sh
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $duplicate)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			xrandr --output HDMI1 --off
			sleep 2
			xrandr --output HDMI1 --auto
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reconnect)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			xrandr --output HDMI1 --auto
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $disconnect)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			xrandr --output HDMI1 --off
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
