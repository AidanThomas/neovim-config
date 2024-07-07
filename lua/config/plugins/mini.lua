local M = {}
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local load = augroup("Load mini.nvim modules", { clear = true })

M.register_modules = function(modules)
    for _, v in ipairs(modules) do
        local module = v[1]
        local config = M.config[module] or {}
        local event = v[2][1]
        local pattern = v[2][2]

        autocmd(event, {
            desc = "Load " .. module,
            pattern = { pattern },
            group = load,
            callback = function()
                require(module).setup(config)
            end
        })
    end
end

M.config = {
    ["mini.notify"] = {
        content = {
            format = function(notif)
                return "[" .. notif.level .. "] " .. notif.msg
            end
        },
    }
}

return M
