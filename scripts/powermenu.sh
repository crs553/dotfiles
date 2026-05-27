#!/bin/sh

confirm() {
    prompt="$1"
    chosen=$(printf "No\nYes" | wofi --dmenu --prompt "$prompt" --width 200 --height 80)
    [ "$chosen" = "Yes" ]
}

chosen=$(echo -e "  Lock\n⏻  Power Off\n  Reboot\n󰤄  Suspend\n  Logout" |
  wofi --dmenu --insensitive --width 250 --height 300)

case "$chosen" in
"  Lock") hyprlock ;;
"⏻  Power Off") confirm "Power off?" && systemctl poweroff ;;
"  Reboot") confirm "Reboot?" && systemctl reboot ;;
"󰤄  Suspend") systemctl suspend ;;
"  Logout") hyprctl dispatch exit ;;
esac
