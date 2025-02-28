return {
	'saghen/blink.cmp',

	dependencies = 'rafamadriz/friendly-snippets',

	version = '*',

	build = "nix run .#build-plugin. --extra-experimental-features nix-command --extra-experimental-features flakes",

	opts = {

		keymap = { preset = 'default' },

		fuzzy = {
			prebuilt_binaries = {
				download = false,
			},
		},

		appearance = {
			nerd_font_variant = 'mono'
		},

		-- experimental signature help support
		signature = { enabled = true }

	},
}
