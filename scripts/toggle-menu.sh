#!/bin/sh
set -eu

case "$1" in
notes_menu.sh | powermenu.sh) ;;
*)
	echo "Unknown script: $1" >&2
	exit 1
	;;
esac

if pgrep -x wofi >/dev/null; then
	pkill wofi
else
	"$HOME/.dotfiles/scripts/$1"
fi
