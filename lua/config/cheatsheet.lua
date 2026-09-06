local M = {}

local native_operations = {
	{ "Normal", "f{char} / F{char}", "Find next / previous character" },
	{ "Normal", "t{char} / T{char}", "Move before next / previous character" },
	{ "Normal", "; / ,", "Repeat / reverse character search" },
	{ "Normal", "/ / ?", "Search forward / backward" },
	{ "Normal", "n / N", "Next / previous search result" },
	{ "Normal", "* / #", "Search word under cursor forward / backward" },
	{ "Normal", "R", "Enter replace mode" },
	{ "Normal", "<C-f> / <C-b>", "Scroll one page down / up" },
	{ "Normal", "<C-d> / <C-u>", "Scroll half a page down / up" },
	{ "Normal", "zz / zt / zb", "Center / top / bottom current line" },
	{ "Normal", "zR / zM", "Open / close all folds" },
	{ "Visual", "v / V / <C-v>", "Character / line / block selection" },
	{ "LSP", "<C-]>", "Go to definition" },
	{ "LSP", "K", "Show hover documentation" },
	{ "LSP", "grr", "List references" },
	{ "LSP", "gri", "Go to implementation" },
	{ "LSP", "grt", "Go to type definition" },
	{ "LSP", "grn", "Rename symbol" },
	{ "LSP", "gra", "Code action" },
	{ "LSP", "[d / ]d", "Previous / next diagnostic" },
	{ "Terminal", [[<C-\><C-n>]], "Return to Normal mode" },
}

local modes = {
	{ "n", "Normal" },
	{ "x", "Visual" },
	{ "o", "Operator" },
	{ "i", "Insert" },
	{ "c", "Command" },
	{ "t", "Terminal" },
}

local function add_mapping(items, seen, mode, mapping)
	if not mapping.desc or mapping.desc == "" then
		return
	end

	local id = table.concat({ mode, mapping.lhs }, "\0")
	if seen[id] then
		return
	end

	seen[id] = true
	items[#items + 1] = {
		text = string.format("%-8s %-20s %s", mode, mapping.lhs, mapping.desc),
	}
end

local function collect_items()
	local items = {}
	local seen = {}

	for _, operation in ipairs(native_operations) do
		items[#items + 1] = {
			text = string.format("%-8s %-20s %s", operation[1], operation[2], operation[3]),
		}
	end

	for _, mode in ipairs(modes) do
		for _, mapping in ipairs(vim.api.nvim_buf_get_keymap(0, mode[1])) do
			add_mapping(items, seen, mode[2], mapping)
		end

		for _, mapping in ipairs(vim.api.nvim_get_keymap(mode[1])) do
			add_mapping(items, seen, mode[2], mapping)
		end
	end

	table.sort(items, function(left, right)
		return left.text < right.text
	end)

	return items
end

function M.open()
	Snacks.picker.pick({
		title = "Keymap Cheat Sheet",
		items = collect_items(),
		format = "text",
		preview = "none",
		confirm = "close",
		layout = { preset = "vertical" },
	})
end

return M
