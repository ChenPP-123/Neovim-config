return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1001,
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
