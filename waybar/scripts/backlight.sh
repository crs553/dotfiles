#!/usr/bin/env bash
# Waybar backlight module. Prints nothing when no backlight device exists,
# which makes the module collapse on the workstation.
set -euo pipefail
shopt -s nullglob

for device in /sys/class/backlight/*; do
  current=$(cat "$device/brightness" 2>/dev/null) || continue
  maximum=$(cat "$device/max_brightness" 2>/dev/null) || continue
  [[ $maximum =~ ^[0-9]+$ ]] || continue
  (( maximum > 0 )) || continue

  percent=$(( (current * 100 + maximum / 2) / maximum ))
  printf "<span foreground='#cba6f7'></span> %d%%\n" "$percent"
  exit 0
done

exit 0
