-- 复用 toggleterm 管理 LazyGit，避免普通终端与 Git 界面共享同一个终端实例。
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit", -- 打开浮窗时启动的命令。
	dir = "git_dir", -- 在当前文件所在 Git 仓库的根目录启动。
	direction = "float", -- 此终端使用浮动窗口，不影响底部水平终端。
	hidden = true, -- Ctrl + ` 只开关普通终端；LazyGit 仅由下面的 toggle 函数控制。
	display_name = "LazyGit", -- 作为浮窗标题显示。
	float_opts = {
		border = "single",
		-- 每次打开时以当前窗口为基准计算 70% 的尺寸。
		width = function()
			return math.floor(vim.api.nvim_win_get_width(0) * 0.8)
		end,
		height = function()
			return math.floor(vim.api.nvim_win_get_height(0) * 0.8)
		end,
		title_pos = "left",
	},
	on_open = function(term)
		-- LazyGit 需要终端模式接收按键；按 Esc 后会进入普通模式。
		-- 状态栏中的表达式会在模式切换时重新计算。
		vim.wo[term.window].statusline = " LazyGit  |  %{mode() ==# 't' ? 'TERMINAL' : 'NORMAL'} "
	end,
})

-- M 是此模块对外公开的接口表；lazygit 终端实例保持在模块内部。
-- Terminal、lazygit 和 M 都是本文件的局部变量；require(...)只会获取文件最后的returen对象，因此只有 return 的 M 会被导出。
-- 外部只能访问 M 中公开的方法，例如 require("plugins.lazygit").toggle()。
local M = {}

function M.toggle()
	lazygit:toggle()
	-- M.toggle 可供其他文件通过 require("plugins.lazygit").toggle() 调用。
	-- 打开已创建的 LazyGit 终端；再次调用则关闭同一个浮窗。
end

return M
