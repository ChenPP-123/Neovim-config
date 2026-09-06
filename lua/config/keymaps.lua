local keymap = vim.keymap

-- 搜索。
local telescope = require("telescope.builtin")
keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>fb", telescope.buffers, { desc = "List buffers" })
keymap.set("n", "<leader>fo", telescope.oldfiles, { desc = "List old files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope projects<CR>", { desc = "Recent projects" })

-- 文件。
keymap.set("n", "<leader>o", require("oil").toggle_float, { desc = "Open Oil" })

-- 终端与 Git。
keymap.set("n", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
keymap.set("n", "<leader>gg", function()
	require("plugins.lazygit").toggle()
end, { desc = "切换 LazyGit" })

-- 编辑器。
keymap.set("n", "zo", "zR", { desc = "Open all folds" })
keymap.set("n", "zc", "zM", { desc = "Close all folds" })
keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<CR>", { desc = "Render markdown" })
keymap.set("x", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- LSP 与诊断。
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义" })
keymap.set("n", "<leader>e", function()
	require("trouble").toggle({
		mode = "diagnostics",
		focus = false,
		filter = { buf = 0 },
	})
end, { desc = "切换当前诊断" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "上一个诊断" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "下一个诊断" })

-- 用浮窗展示常用按键，避免记忆负担。
keymap.set("n", "<leader>?", function()
	-- 每行同时放置两个相关分区，缩短浮窗高度。
	local lines = {
		" Neovim Cheat Sheet",
		" <leader> = Space  ·  Esc closes",
		"",
		" SEARCH                              LSP",
		" f/F{char}  下/上一个字符            gd          跳转到定义",
		" t/T{char}  字符前/后                K           查看光标处说明",
		" ; / ,      重复 / 反向重复          grr         查找引用",
		" / / ?      向后 / 向前搜索          grn         重命名符号",
		" n / N      下一个 / 上一个结果      gra         代码操作",
		" * / #      搜索光标下单词           [d / ]d     上一个 / 下一个诊断",
		"                                     <leader>e   当前文件诊断列表",
		"",
		" VISUAL                              COMPLETION",
		" v          按字符选择               Tab         接受或切换候选",
		" V          按行选择                 Shift-Tab   反向切换候选",
		" Ctrl-v     块选择                   Ctrl-Space  打开补全/切换文档",
		"                                     Ctrl-e      关闭补全菜单",
		"                                     Ctrl-b/f    文档向上/下滚动",
		"                                     Ctrl-k      显示/隐藏签名帮助",
		"",
		" REPLACE                             SCROLL",
		" R          进入替换模式             Ctrl-f/b    向下 / 向上整页",
		"                                     Ctrl-d/u    向下 / 向上半页",
		"                                     zz          当前行居中",
		"                                     zt / zb     当前行置顶 / 置底",
	}

	-- 使用显示宽度计算窗口，中文字符会占两个单元格。
	local content_width = 0
	for _, line in ipairs(lines) do
		content_width = math.max(content_width, vim.fn.strdisplaywidth(line))
	end

	-- 给边框留出空间，同时不超过当前终端的可用范围。
	local width = math.min(content_width + 4, vim.o.columns - 4)
	local height = math.min(#lines, vim.o.lines - 4)

	-- 创建不进入缓冲区列表的临时只读内容。
	local buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].modifiable = false
	vim.bo[buf].bufhidden = "wipe"

	-- 将速查表居中显示为无状态栏的圆角浮窗。
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	})
	vim.wo[win].wrap = false

	-- Esc 仅关闭这个临时浮窗。
	keymap.set("n", "<Esc>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf })
end, { desc = "Show Neovim cheat sheet" })
