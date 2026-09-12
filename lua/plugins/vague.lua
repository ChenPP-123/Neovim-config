return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        -- 主题必须先于其他启动插件应用高亮。
        priority = 1000,
        opts = {
            transparent = false,
            bold = true,
            italic = true,
        },
        config = function(_, opts)
            require("vague").setup(opts)
            vim.cmd.colorscheme("vague")
        end,
    },
}
