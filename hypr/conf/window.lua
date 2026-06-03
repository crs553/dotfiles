local theme = require("conf.theme")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 2,
    col = {
      active_border = { colors = { theme.mauve, theme.blue }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = true,
    resize_corner = true,
    layout = "dwindle",
    allow_tearing = false,
  },
})
