return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
		},
	},
}
