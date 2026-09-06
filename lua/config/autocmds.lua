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

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})

-- 终端缓冲区使用双 Esc 返回 Normal 模式，不影响其他缓冲区。
vim.api.nvim_create_autocmd("TermOpen", {
	group = group,
	pattern = "term://*",
	callback = function()
		vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { buffer = 0 })
	end,
})
