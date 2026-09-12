--[[
新版 nvim-treesitter 负责安装和更新 parser

基本用法：
  1. 用 :TSInstall <parser> 安装语言 parser，例如 :TSInstall python typescript tsx。
  2. 用 :TSUpdate 在更新 nvim-treesitter 后同步已安装的 parser。
  3. 用 :TSUninstall <parser> 删除不再需要的 parser。

语言与文件类型：
  - 上述命令中的名称是 parser 名；本文件的 filetypes 是 Neovim 文件类型。
  - 两者不一定相同：TSX parser 名为 "tsx"，对应文件类型通常是 "typescriptreact"。
  - 新增语言时，先安装 parser，再将需要启用功能的文件类型加入 filetypes。
  - 删除语言时，从 filetypes 移除对应文件类型，并按需执行 :TSUninstall <parser>。

本文件在 FileType 事件中为 filetypes 内的文件启用：
  - vim.treesitter.start()：语法高亮。
]]

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local filetypes = {
      "lua",
      "vim",
      "vimdoc",
      "python",
      "json",
      "html",
      "yaml",
      "toml",
      "markdown",
    }

    require("nvim-treesitter").install(filetypes)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
