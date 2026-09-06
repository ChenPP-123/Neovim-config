-- 集中声明由 vim.pack 管理的插件；具体配置在 plugins/ 中。
vim.pack.add({
    {
        src = "https://github.com/rose-pine/neovim.git",
        name = "rose-pine",
    },
    { src = "https://github.com/sphamba/smear-cursor.nvim.git" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim.git"},
    { src = "https://github.com/DrKJeff16/project.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim.git" },
    { src = "https://github.com/lewis6991/gitsigns.nvim.git" },
    -- LSP 和格式化工具统一由 Mason 安装。
    { src = "https://github.com/mason-org/mason.nvim.git" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    -- Blink v1 的配置接口稳定，避免 v2 的破坏性变更。
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1") },
    { src = "https://github.com/folke/trouble.nvim" },
})
