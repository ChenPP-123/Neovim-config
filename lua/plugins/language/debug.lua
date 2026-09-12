-- 本文件负责 Python 调试入口、调试界面和会话快捷键。
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- 提供 Python 的 debugpy 适配器配置和测试调试入口。
        "mfussenegger/nvim-dap-python",
        {
            -- 展示变量、调用栈、断点和调试控制台；nvim-nio 是其异步依赖。
            "rcarriga/nvim-dap-ui",
            dependencies = { "nvim-neotest/nvim-nio" },
        },
    },
    keys = {
        -- 功能键负责调试流程控制。
        {
            "<F5>",
            function()
                require("dap").continue()
            end,
            desc = "Debug: Start or continue",
        },
        {
            "<F10>",
            function()
                require("dap").step_over()
            end,
            desc = "Debug: Step over",
        },
        {
            "<F11>",
            function()
                require("dap").step_into()
            end,
            desc = "Debug: Step into",
        },
        {
            "<F12>",
            function()
                require("dap").step_out()
            end,
            desc = "Debug: Step out",
        },
        -- <leader>b 分组负责断点、界面、求值和测试调试。
        {
            "<leader>bb",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Debug: Toggle breakpoint",
        },
        {
            "<leader>bB",
            function()
                local condition = vim.fn.input("Breakpoint condition: ")
                if condition ~= "" then
                    require("dap").set_breakpoint(condition)
                end
            end,
            desc = "Debug: Conditional breakpoint",
        },
        {
            "<leader>be",
            function()
                require("dapui").eval()
            end,
            mode = { "n", "x" },
            desc = "Debug: Evaluate expression",
        },
        {
            "<leader>br",
            function()
                require("dap").repl.open()
            end,
            desc = "Debug: Open REPL",
        },
        {
            "<leader>bu",
            function()
                require("dapui").toggle()
            end,
            desc = "Debug: Toggle UI",
        },
        {
            "<leader>bq",
            function()
                require("dap").terminate()
            end,
            desc = "Debug: Terminate",
        },
        {
            "<leader>bt",
            function()
                require("dap-python").test_method()
            end,
            desc = "Debug: Test method",
        },
        {
            "<leader>bT",
            function()
                require("dap-python").test_class()
            end,
            desc = "Debug: Test class",
        },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- debugpy 由 Mason 安装；使用明确路径，不依赖当前 shell 的 PATH。
        local debugpy_adapter = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter"

        require("dap-python").setup(debugpy_adapter)
        dapui.setup()

        -- 调试开始时打开界面，会话结束后自动恢复普通编辑布局。
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
