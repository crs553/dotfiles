#!/bin/sh

confirm() {
	prompt="$1"
	chosen=$(printf "No\nYes" | wofi --dmenu --prompt "$prompt" --width 200 --height 80)
	[ "$chosen" = "Yes" ]
}

chosen=$(printf "  Lock\n⏻  Power Off\n  Reboot\n󰤄  Suspend\n  Logout" |
	wofi --dmenu --insensitive --width 250 --height 500 --lines 5 --columns 1)

case "$chosen" in
"  Lock") hyprlock ;;
"⏻  Power Off") confirm "Power off?" && systemctl poweroff ;;
"  Reboot") confirm "Reboot?" && systemctl reboot ;;
"󰤄  Suspend") systemctl suspend ;;
"  Logout") hyprctl dispatch exit ;;
esac
