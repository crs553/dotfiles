-- Hyprland Lua config
-- Modules loaded in dependency order:
--   theme        → Catppuccin Mocha colour palette (consumed by window.lua)
--   environments → Wayland env vars (MOZ_ENABLE_WAYLAND, etc.)
--   window       → General appearance (gaps, borders, layout)
--   decoration   → Rounding, opacity, blur, shadows
--   animations   → Bezier curves & animation presets
--   layout       → Dwindle, cursor, binds behaviour
--   misc         → Logo/splash suppression, focus settings
--   monitor      → Output configuration (eDP-1 & DP-*)
--   keyboard     → Input layout, per-device keyboard overrides
--   device       → Per-device settings (mouse, touchscreen)
--   autostart    → Startup commands (waybar, nm-applet, hyprpaper)
--   windowrules  → Workspace assignments, floating, layer rules
--   binds        → All keybinds including resize submap

require("conf.theme")
require("conf.environments")
require("conf.window")
require("conf.decoration")
require("conf.animations")
require("conf.layout")
require("conf.misc")
require("conf.monitor")
require("conf.keyboard")
require("conf.device")
require("conf.autostart")
require("conf.windowrules")
require("conf.binds")
