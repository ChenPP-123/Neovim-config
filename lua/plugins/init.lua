-- 接收各插件的初始化实例

-- 先加载主题，后续 UI 插件会继承它的高亮。
require("plugins.rose-pine")

-- 编辑器界面。
require("plugins.smear-cursor")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.indent-blankline")

-- 文件与搜索；Telescope 的 projects 扩展依赖 Project 已初始化。
require("plugins.project")
require("plugins.telescope")
require("plugins.oil")
require("plugins.tree-sitter")

-- 终端必须先于 LazyGit 的首次调用完成初始化。
require("plugins.toggleterm")

-- 语言工具共享 Mason、补全、格式化与诊断 UI 的初始化入口。
require("plugins.lsp")
