local group = vim.api.nvim_create_augroup("AutoCmds", {
    clear = true,
})

-- 在重新聚焦或空闲时检查被外部程序修改的文件。
vim.api.nvim_create_autocmd({
    "FocusGained",
    "BufEnter",
    "CursorHold",
    "CursorHoldI",
}, {
    group = group,
    command = "checktime",
})

-- 光标停留时显示当前位置的诊断，不抢占编辑焦点。
vim.api.nvim_create_autocmd("CursorHold", {
    group = group,
    callback = function()
        vim.diagnostic.open_float(nil, {
            scope = "cursor",
            focusable = false,
            focus_id = "cursor_diagnostic",
        })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({ timeout = 500 })
    end,
})
