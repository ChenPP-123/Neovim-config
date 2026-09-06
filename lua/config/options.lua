vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4             -- \t字符显示为4格
vim.opt.shiftwidth = 0          -- 一次缩进操作的宽度为4，0代表自动使用tabst:op的值
vim.opt.expandtab = true        -- 按tab实际插入空格

vim.opt.autoindent = true       -- 自动缩进
vim.opt.smartindent = false
vim.opt.cindent = false

vim.opt.autoread = true         -- 当发现buffer内存被修改时，重新读取文件
vim.opt.updatetime = 250        -- 每250ms，准备触发一些等待事件，比如checktime

vim.opt.showmode = false        -- 命令行不显示mode
