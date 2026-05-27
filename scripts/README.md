# scripts

Hyprland utility scripts. All use [wofi](https://github.com/wofi/wofi) for menu UIs.

| Script | Description |
|--------|-------------|
| `powermenu.sh` | Power menu: lock, poweroff, reboot, suspend, logout |
| `toggle_powermenu.sh` | Toggle wofi then run `powermenu.sh` |
| `notes_menu.sh` | Browse/sync notes in `~/Documents/notes` via wofi |
| `toggle_notes_menu.sh` | Toggle wofi then run `notes_menu.sh` |
| `toggle-menu.sh` | Shared toggle helper used by the above two |
| `wallpaper-select.sh` | Browse & set wallpapers with thumbnail previews |

**Dependencies:** `wofi`, `hyprlock`, `hyprpaper`, `ImageMagick`, `findutils`
