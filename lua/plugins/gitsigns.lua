return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>gh",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview Git hunk",
		},
		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Toggle Git hunk stage",
		},
		{
			"<leader>gr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset Git hunk",
		},
	},
	opts = {
		current_line_blame = true,
	},
}
