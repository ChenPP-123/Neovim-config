-- 本文件负责自动安装 LSP 之外的语言工具依赖。
return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "ruff",
                "stylua",
                "debugpy",
                "prettier",
                "taplo",
            },
            run_on_start = true,
        },
    },
}
