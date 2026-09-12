-- blink.cmp 负责收集并展示补全候选；LSP 能力声明在 lsp.lua 中接入。
return {
    "saghen/blink.cmp",
    version = "1.*", -- 固定稳定版，避免自动进入仍有破坏性改动的 v2。
    event = "InsertEnter",
    opts = {
        -- Tab 选择并接受候选；在 snippet 中跳到下一个占位符。
        keymap = { preset = "super-tab" },

        -- 不预选候选，避免补全菜单打开时产生不明确的选中状态。
        completion = {
            list = { selection = { preselect = false } },
        },

        -- LSP 提供语义补全，其余来源补充路径、snippet 和当前文件中的文本。
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
