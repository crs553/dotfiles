#!/bin/sh

case "$1" in
volume)
	shift
	if [ "$1" = "toggle" ]; then
		wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	else
		wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ "$1"
	fi
	OUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
	if printf '%s' "$OUT" | grep -q MUTED; then
		VALUE="Muted"
	else
		VALUE="$(printf '%s' "$OUT" | awk '{printf "%d%%", $2 * 100}')"
	fi
	COLOR="rgb(f5c2e7)"
	;;
brightness)
	shift
	# Pause auto-brightness so the manual change sticks; resume after 5 min
	if systemctl is-active --quiet illuminanced.service; then
		systemctl stop illuminanced.service
		systemctl stop illuminanced-resume.timer 2>/dev/null
		systemd-run --collect --unit=illuminanced-resume --on-active=300 \
			systemctl start illuminanced.service >/dev/null 2>&1 || true
	fi
	brightnessctl -d intel_backlight s "$1"
	V=$(brightnessctl -d intel_backlight get)
	M=$(brightnessctl -d intel_backlight max)
	VALUE="$((V * 100 / M))%"
	COLOR="rgb(f9e2af)"
	;;
*) exit 0 ;;
esac

hyprctl notify -1 1500 "$COLOR" "$VALUE"
