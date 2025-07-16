local wezterm = require 'wezterm'

local config = {}

config.color_scheme = "Catppuccin Mocha" -- Options: Latte, Frappe, Macchiato, or Mocha
config.font = wezterm.font("MesloLGS NF")
config.font_size = 12

-- Miscellaneous settings
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = false
config.audible_bell = "Disabled"

return config
