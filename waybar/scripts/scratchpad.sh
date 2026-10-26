#!/usr/bin/env bash
# Shows a count only while windows exist on Hyprland's special:magic workspace.
set -euo pipefail

command -v hyprctl >/dev/null 2>&1 || exit 0

count=$(hyprctl clients -j 2>/dev/null | grep -c '"name": "special:magic"' || true)
(( count > 0 )) || exit 0

printf "<span foreground='#94e2d5'></span> %d\n" "$count"
