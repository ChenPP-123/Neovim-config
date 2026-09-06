require("toggleterm").setup({
    direction = "horizontal",
    size = function()
        return math.floor(vim.o.lines * 0.25)
    end,
    start_in_insert = true,
    persist_size = false,
    persist_mode = true,
    close_on_exit = true,
    shade_terminals = false,
    autochdir = true,
})
