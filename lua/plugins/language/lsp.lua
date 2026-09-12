-- 本文件负责语言服务器的安装、启用，以及 Neovim 原生 LSP 的公共配置。
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- blink.cmp 为语言服务器补充补全能力。
        "saghen/blink.cmp",

        -- Mason 管理外部工具，mason-lspconfig 连接 Mason 与原生 LSP。
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local servers = { "basedpyright", "lua_ls" }
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- 只把补全能力交给本配置明确启用的服务器，避免影响未来安装的其他 LSP。
        for _, server in ipairs(servers) do
            vim.lsp.config(server, { capabilities = capabilities })
        end

        -- 当前仓库是 Neovim 配置：让 lua_ls 理解 LuaJIT、vim API 和插件配置类型。
        -- 普通 Lua 项目不会继承这些 Neovim 专用设置，应继续使用项目自己的 .luarc 配置。
        vim.lsp.config("lua_ls", {
            on_init = function(client)
                local workspace = client.workspace_folders and client.workspace_folders[1]
                if not workspace or workspace.name ~= vim.fn.stdpath("config") then
                    return
                end

                client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = { "lua/?.lua", "lua/?/init.lua" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                            },
                        },
                    },
                })
            end,
            settings = { Lua = {} },
        })

        -- 语言服务器由根目录安装脚本安装，Mason 只启用本配置声明的服务器。
        require("mason-lspconfig").setup({
            automatic_enable = servers,
        })

        -- 映射只在语言服务器已连接的缓冲区生效，避免占用普通文本的按键。
        local keymap_group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = keymap_group,
            callback = function(event)
                local function map(keys, action, description)
                    vim.keymap.set("n", keys, action, {
                        buffer = event.buf,
                        desc = "LSP: " .. description,
                    })
                end

                map("gd", vim.lsp.buf.definition, "Go to definition")
                map("gD", vim.lsp.buf.declaration, "Go to declaration")
                map("gi", vim.lsp.buf.implementation, "Go to implementation")
                map("gr", vim.lsp.buf.references, "Find references")
                map("K", vim.lsp.buf.hover, "Hover documentation")
                map("<leader>k", vim.lsp.buf.signature_help, "Signature help")
                map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                map("<leader>d", vim.diagnostic.open_float, "Show diagnostic")
                map("<leader>dl", vim.diagnostic.setloclist, "Diagnostic list")
            end,
        })
    end,
}
