-- 本文件负责语言服务器的安装、启用，以及 Neovim 原生 LSP 的公共配置。
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- blink.cmp 为语言服务器补充补全能力。
		"saghen/blink.cmp",

		-- Mason 管理外部工具，mason-lspconfig 连接 Mason 与原生 LSP。
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local servers = { "basedpyright", "lua_ls" }
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- 只把补全能力交给本配置明确启用的服务器，避免影响未来安装的其他 LSP。
		for _, server in ipairs(servers) do
			vim.lsp.config(server, { capabilities = capabilities })
		end

		-- 当前仓库是 Neovim 配置：让 lua_ls 理解 LuaJIT、vim API 和插件配置类型。
		-- 普通 Lua 项目不会继承这些 Neovim 专用设置，应继续使用项目自己的 .luarc 配置。
		vim.lsp.config("lua_ls", {
			on_init = function(client)
				local workspace = client.workspace_folders and client.workspace_folders[1]
				if not workspace or workspace.name ~= vim.fn.stdpath("config") then
					return
				end

				client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
							},
						},
					},
				})
			end,
			settings = { Lua = {} },
		})

		-- Mason 自动安装并且只启用 Python、Lua 两个语言服务器。
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_enable = servers,
		})

		-- mason-lspconfig 只管理 LSP；格式化工具由通用安装器补齐。
		require("mason-tool-installer").setup({
			ensure_installed = { "ruff", "stylua" },
			run_on_start = true,
		})

		-- Neovim 已提供跳转、重命名等默认 LSP 映射，这里只补充诊断详情入口。
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
			desc = "Show diagnostic",
		})
	end,
}
