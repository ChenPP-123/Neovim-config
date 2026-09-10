vim.keymap.set("x", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<C-p>", "<cmd>bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-d>", "<cmd>bd<CR>", { desc = "delete buffer" })
