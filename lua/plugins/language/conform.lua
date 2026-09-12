-- conform.nvim 为不同文件类型提供唯一、可预测的保存时格式化流程。
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			-- 先应用 Ruff 的安全 lint 修复，再排序 import，最后统一代码格式。
			python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },

			-- Lua 只由 Stylua 格式化。
			lua = { "stylua" },
		},

		-- 保存前同步格式化，确保写入磁盘的是最终内容；不回退到 LSP 格式化。
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "never",
		},
	},
}
