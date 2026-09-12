return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        notifier = {
            timeout = 5000,
        },
        picker = {
            enabled = true,
            sources = {
                projects = {
                    dev = {
                        "~/.config",
                        "~/Workspace",
                    },
                    recent = true,
                    confirm = { "tcd", "close" },
                },
            },
        },
        explorer = {
            enabled = true,
            replace_netrw = true,
            trash = true,
        },
        terminal = {
            win = {
                position = "bottom",
                height = 0.25,
            },
        },
        lazygit = {
            win = {
                position = "float",
                width = 0.9,
                height = 0.9,
            },
        },
        indent = {
            enabled = true,
            indent = { char = "┊" },
            scope = {
                enabled = true,
                char = "│",
            },
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Config Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "File Explorer",
        },
        {
            "<C-`>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
    },
}
