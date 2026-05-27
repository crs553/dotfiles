#!/bin/sh

NOTES_DIR="$HOME/notes"
TERM="kitty"

menu_items=$(
  cat <<EOF
Open Notes
Sync Notes
EOF
)

notes_list=$(find "$NOTES_DIR" -type f | sed "s|$NOTES_DIR/||")
full_menu=$(printf "%s\n%s" "$menu_items" "$notes_list")

selected=$(printf "%s\n" "$full_menu" |
  wofi --dmenu --prompt "Notes" --insensitive --no-custom)
case "$selected" in
"Open Notes")
  "$TERM" sh -c "cd '$NOTES_DIR' && nvim ."
  ;;

"Sync Notes")
  cd "$NOTES_DIR" || exit
  git pull || notify-send -u critical "Notes Sync" "Pull failed"
  if ! git diff --quiet && ! git diff --staged --quiet; then
    git add .
    git commit -m 'sync: update notes' && git push && notify-send "Notes" "Synced successfully" || notify-send -u critical "Notes Sync" "Commit/push failed"
  else
    notify-send "Notes" "Nothing to sync"
  fi
  ;;

*)
  if [ -n "$selected" ]; then
    "$TERM" sh -c "cd '$NOTES_DIR' && nvim '$selected'"
  fi
  ;;
esac
