return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Git Hunks" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Toggles" },
			{ "<leader>u", group = "UI" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ keys = "<leader>", loop = true })
			end,
			desc = "Browse Keymaps",
		},
	},
}
