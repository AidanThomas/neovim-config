require("dap-go").setup()

local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- C# debugging (requires netcoredbg from Mason)

dap.adapters.coreclr = {
    type = 'executable',
    command = 'netcoredbg',
    args = {
        '--interpreter=vscode'
    }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            -- vim.fn.system("make", "build-web")
            return "/home/aidant/dev/cm-dev/Incus.Reach/src/web/bin/Debug/net8.0/web.dll"
        end,
    },
}

require("nvim-dap-virtual-text").setup()
require("telescope").load_extension("dap")
