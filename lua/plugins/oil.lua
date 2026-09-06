require("oil").setup({
    default_file_explorer = true, -- 用oil接管“nvim .”、“:e .”等buffer
    columns = { "icon" },
    view_options = {
        show_hidden = true,
    },
    delete_to_trash = true,
    keymaps = {                                   -- 修改按键映射
        ["h"] = { "actions.parent", mode = "n" }, -- 返回上级目录
        ["l"] = {
            callback = function()
                local entry = require("oil").get_cursor_entry() -- 返回光标获取
                if entry and entry.type == "directory" then     -- 当光标下为dircotry时执行
                    require("oil").select()
                end
            end,
            mode = "n",
        },
        ["<CR>"] = { "actions.select", mode = "n" }, -- 打开文件或进入目录
    },
})
