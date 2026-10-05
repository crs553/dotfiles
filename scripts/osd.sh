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
	# No backlight to control (e.g. NVIDIA-driven external monitors).
	# Don't hardcode a device: brightnessctl auto-detects per machine,
	# and intel_backlight does not exist on the workstation.
	if ! brightnessctl -l 2>/dev/null | grep -q "class 'backlight'"; then
		exit 0
	fi
	# Pause auto-brightness so the manual change sticks; resume after 5 min
	if systemctl is-active --quiet illuminanced.service; then
		systemctl stop illuminanced.service
		systemctl stop illuminanced-resume.timer 2>/dev/null
		systemd-run --collect --unit=illuminanced-resume --on-active=300 \
			systemctl start illuminanced.service >/dev/null 2>&1 || true
	fi
	brightnessctl s "$1"
	V=$(brightnessctl get)
	M=$(brightnessctl max)
	VALUE="$((V * 100 / M))%"
	COLOR="rgb(f9e2af)"
	;;
*) exit 0 ;;
esac

hyprctl notify -1 1500 "$COLOR" "$VALUE"
