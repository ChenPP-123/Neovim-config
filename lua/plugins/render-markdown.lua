return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	cmd = { "RenderMarkdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>m", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown rendering" },
	},
	opts = {},
}
