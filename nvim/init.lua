require("config.lazy")
require("cs-config")

vim.cmd.colorscheme "catppuccin-mocha"

require('lualine').setup {}
require("oil").setup({
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
	},
})
