return {
	{
		"Saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		main = "blink.cmp",
		opts = {
			keymap = { preset = "super-tab" },
			completion = {
				list = { selection = { preselect = false } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "mason-org/mason.nvim", cmd = "Mason", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"Saghen/blink.cmp",
		},
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "basedpyright", "lua_ls" },
				automatic_enable = { "basedpyright", "lua_ls" },
			})

			require("mason-tool-installer").setup({
				ensure_installed = { "ruff", "stylua" },
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		opts = {
			formatters_by_ft = {
				python = { "ruff_format" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_format = "never",
			},
		},
	},
}
