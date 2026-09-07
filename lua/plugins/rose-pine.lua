return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1001,
	opts = {
		variant = "auto",
		dark_variant = "main",
		dim_inactive_windows = true,
		extend_background_behind_borders = true,
		enable = {
			terminal = true,
			legacy_highlights = true,
		},
	},
	config = function(opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
