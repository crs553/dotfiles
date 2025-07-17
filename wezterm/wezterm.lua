local wezterm = require 'wezterm'

local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback {
  "JetBrains Mono",
  "Symbols Nerd Font Mono", -- for Starship icons
  "Noto Color Emoji",       -- for emojis
}
config.font_size = 12

config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = false
config.audible_bell = "Disabled"

return config
