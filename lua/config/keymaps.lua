-- 这里只保留不属于插件的全局映射；插件映射跟随各自的 Lazy spec。
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
