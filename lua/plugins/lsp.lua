require("mason").setup()

-- 所有服务器共享 Blink 的补全能力；其余服务器配置使用 nvim-lspconfig 默认值。
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

require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        lua = { "stylua" },
    },
    format_on_save = {
        timeout_ms = 3000,
        lsp_format = "never",
    },
})

require("blink.cmp").setup({
    keymap = { preset = "super-tab" },
    completion = {
        list = { selection = { preselect = false } },
    },
})

require("trouble").setup({
    focus = false,
})
