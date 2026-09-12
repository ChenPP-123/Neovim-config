return {
    "folke/snacks.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        notifier = {
            timeout = 5000,
        },
        picker = {
            enabled = true,
            ui_select = true,
            sources = {
                projects = {
                    dev = {
                        "~/.config",
                        "~/Workspace",
                    },
                    recent = true,
                    confirm = { "tcd", "close" },
                },
                explorer = {
                    -- Enter 的 confirm 动作会打开文件或展开目录；h 使用内置动作返回父目录。
                    -- l 先判断当前项是否目录，只有目录才执行 confirm
                    actions = {
                        explorer_open_dir = function(picker, item)
                            if item and item.dir then
                                picker:action("confirm")
                            end
                        end,
                    },
                    win = {
                        list = {
                            keys = {
                                ["<CR>"] = "confirm",
                                ["h"] = "explorer_up",
                                ["l"] = "explorer_open_dir",
                            },
                        },
                    },
                },
            },
        },
        explorer = {
            enabled = true,
            replace_netrw = true,
            trash = true,
        },
        image = {
            enabled = true,
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
            "<C-/>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
    },
}
