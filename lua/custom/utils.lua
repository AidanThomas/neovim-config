M = {}

M.open_float_win = function(buf, opts)
    local ui = vim.api.nvim_list_uis()[1]
    local o = {}

    if opts ~= nil then
        o.height = opts.height or 0.5
        o.width = opts.width or 0.5
        o.title = opts.title
        if o.title then
            o.title_pos = "center"
        end
        o.border = opts.border
    else
        o.height = 0.5
        o.width = 0.5
    end

    o.relative = "win"
    o.style = "minimal"
    o.height = math.floor(o.height * ui.height)
    o.width = math.floor(o.width * ui.width)
    o.col = math.floor(ui.width / 2) - math.floor(o.width / 2)
    o.row = math.floor(ui.height / 2) - math.floor(o.height / 2)

    vim.api.nvim_open_win(buf, true, o)
end

M.vim_print = function(object)
    vim.api.nvim_echo({ { vim.inspect(object) } }, true, {})
end


M.register_mappings = function(mappings)
    local options = { noremap = true, silent = true }
    for mode, maps in pairs(mappings) do
        for lhs, map in pairs(maps) do
            local rhs = map[1]
            local opts = map[2]
            if opts then
                options = vim.tbl_extend('force', options, opts)
            end
            vim.keymap.set(mode, lhs, rhs, options)
        end
    end
end

return M
