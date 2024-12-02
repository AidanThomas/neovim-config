require("dap-go").setup()

local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

-- dapui liseners
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
require("netcoredbg-macOS-arm64").setup(require("dap"))

-- dap.adapters.coreclr = {
--     type = 'executable',
--     command = 'netcoredbg',
--     args = {
--         '--interpreter=vscode'
--     }
-- }
--
-- dap.configurations.cs = {
--     {
--         type = "coreclr",
--         name = "NetCoreDbg: Launch",
--         request = "launch",
--         cwd = function()
--             return vim.fn.getcwd() .. "/src/web"
--         end,
--         program = function()
--             return "/home/aidant/dev/cm-dev/Incus.Reach/src/web/bin/Debug/net8.0/web.dll"
--         end,
--         env = {
--             ASPNETCORE_URLS = "http://*.local.com",
--             ASPNETCORE_ENVIRONMENT = "Development",
--             AzureWebJobsStorage =
--             "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://localhost:10000/devstoreaccount1;QueueEndpoint=http://localhost:10001/devstoreaccount1;TableEndpoint=http://localhost:10002/devstoreaccount1;",
--             CloudStorage_OverrideStorageHost = "true",
--             Redis_Connection = "localhost:6379",
--         }
--     },
-- }
--
-- require("nvim-dap-virtual-text").setup()
-- require("telescope").load_extension("dap")
