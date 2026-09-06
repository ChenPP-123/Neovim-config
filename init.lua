-- Neovim 配置入口：按依赖顺序加载所有模块。
-- 必须先设置 leader，之后注册的 <leader> 快捷键才会使用空格。
vim.g.mapleader = " "

-- 编辑器基础行为。
require("config.options")

-- 先让 vim.pack 注册插件，再初始化各插件配置。
require("config.plugins") -- 声明插件
require("plugins") -- 初始化插件实例

-- 最后注册不依赖插件加载的自动命令和全局快捷键。
require("config.autocmds")
require("config.keymaps")
