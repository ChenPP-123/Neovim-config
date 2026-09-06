require("ibl").setup({
    indent = {
        char = "┊",
    },
    scope = {                       -- 启用作用域高亮
        enabled = true,
        char = "│",
        highlight = "IblScope",
        show_start = true,
        show_end = true,
    },
})
