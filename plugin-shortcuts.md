# Neovim 插件快捷键

本文档记录当前配置明确暴露的插件快捷键，包括插件预设生成的映射。Neovim 自带快捷键和 `lua/config/keymaps.lua` 中的基础编辑映射不在本文档范围内。

## 按键说明

- `<leader>`：空格键
- `N`：普通模式（Normal）
- `I`：插入模式（Insert）
- `X`：可视模式（Visual）

## 文件查找与工具（Snacks）

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `<leader>ff` | N | 智能查找文件，同时结合文件、最近使用记录等来源 |
| `<leader>fp` | N | 打开项目列表，确认后切换工作目录 |
| `<leader>fb` | N | 查找并切换已经打开的缓冲区 |
| `<leader>fc` | N | 查找当前 Neovim 配置目录中的文件 |
| `<leader>fg` | N | 在项目中搜索文本 |
| `<leader>e` | N | 打开文件浏览器 |
| `H` | N | 在 Explorer 中显示或隐藏以点开头的文件 |
| `<leader>gg` | N | 打开 Lazygit 浮动窗口 |
| `<C-/>` | N | 打开或关闭底部终端 |

## Git 操作（Gitsigns）

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `<leader>gp` | N | 在当前行内预览 Git hunk |
| `<leader>gs` | N | 暂存或取消暂存当前 Git hunk |
| `<leader>gr` | N | 撤销当前 Git hunk 中尚未提交的修改 |

## 语言服务与补全

### LSP

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `gd` | N | 跳转到定义 |
| `gD` | N | 跳转到声明 |
| `gi` | N | 跳转到实现 |
| `gr` | N | 查找引用 |
| `K` | N | 显示光标处符号的文档 |
| `<leader>k` | N | 显示函数签名帮助 |
| `<leader>rn` | N | 重命名当前符号 |
| `<leader>ca` | N | 显示可用的代码操作 |
| `[d` | N | 跳转到上一条诊断 |
| `]d` | N | 跳转到下一条诊断 |
| `<leader>d` | N | 在浮动窗口中显示当前光标位置的诊断详情 |
| `<leader>dl` | N | 把当前缓冲区的诊断写入 location list |

以上映射仅在语言服务器已连接的缓冲区生效。光标停留在诊断上时，也会自动显示非抢焦点的诊断浮窗。

### Blink 补全（super-tab 预设）

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `<C-Space>` | I | 显示补全候选或切换补全文档 |
| `<C-e>` | I | 关闭补全菜单；菜单未打开时执行原按键行为 |
| `<Tab>` | I | 接受当前候选；在 snippet 中接受或跳到下一个占位符 |
| `<S-Tab>` | I | 跳到上一个 snippet 占位符 |
| `<Up>` | I | 选择上一个补全候选 |
| `<Down>` | I | 选择下一个补全候选 |
| `<C-p>` | I | 选择上一个补全候选；不可用时交给已有映射 |
| `<C-n>` | I | 选择下一个补全候选；不可用时交给已有映射 |
| `<C-b>` | I | 向上滚动补全文档 |
| `<C-f>` | I | 向下滚动补全文档 |
| `<C-k>` | I | 显示或隐藏函数签名帮助 |

Blink 的按键只在补全或 snippet 操作可用时接管；否则会尽量回退到原来的按键行为。

## Python 调试（nvim-dap）

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `<F5>` | N | 启动调试或继续运行到下一个断点 |
| `<F10>` | N | 单步跳过（Step over） |
| `<F11>` | N | 单步进入（Step into） |
| `<F12>` | N | 单步跳出（Step out） |
| `<leader>bb` | N | 添加或删除当前行断点 |
| `<leader>bB` | N | 输入条件并添加条件断点 |
| `<leader>be` | N / X | 查看光标下或选中表达式的值 |
| `<leader>br` | N | 打开调试 REPL |
| `<leader>bu` | N | 打开或关闭调试界面 |
| `<leader>bq` | N | 终止当前调试会话 |
| `<leader>bt` | N | 调试光标所在的 Python 测试方法 |
| `<leader>bT` | N | 调试光标所在的 Python 测试类 |

## Markdown

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `<leader>m` | N | 打开或关闭当前 Markdown 缓冲区的渲染效果 |

## 没有配置快捷键的插件

以下插件会自动运行，或通过命令使用：

- `conform.nvim`：保存文件时自动格式化
- `nvim-treesitter`：自动提供语法高亮
- `lualine.nvim`：自动显示状态栏
- `vague.nvim`：启动时应用主题
- `im-select.nvim`：根据模式自动切换输入法
- `smear-cursor.nvim`：自动显示光标动画
- `vim-repeat`：为支持的插件操作提供重复能力
