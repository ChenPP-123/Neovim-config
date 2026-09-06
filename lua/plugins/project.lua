require("project").setup({
    manual_mode = false,        -- 自动识别
    silent_chdir = true,        -- 静默切换目录

    telescope = {
        sort = "newest",        -- 按最近项目排序
        tilde = true,           -- 将"/Users/username"显示为"~"
    },
})
