local M = {}

M.toggle = function()
    if not M.open then
        vim.cmd.tabnew()
        local current_buf = vim.api.nvim_get_current_buf()
        if M.buf == nil then
            vim.fn.termopen(vim.o.shell)
            M.buf = current_buf
            vim.api.nvim_buf_set_option(M.buf, "buflisted", false)
            vim.api.nvim_buf_set_name(M.buf, "Terminal")
            vim.cmd.set("nonu")
        elseif M.buf ~= current_buf then
            vim.api.nvim_set_current_buf(M.buf)
            vim.api.nvim_buf_delete(current_buf, { force = true })
        else
            vim.api.nvim_set_current_buf(M.buf)
        end
        vim.cmd.set("filetype=terminal")
        M.open = true
        vim.cmd.startinsert()
    else
        vim.cmd.tabclose()
        M.open = false
    end
end

return M
