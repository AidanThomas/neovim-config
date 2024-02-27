local M = {}

M.toggle = function()
    if not M.open then
        vim.cmd.tabnew()
        if M.buf == nil then
            vim.fn.termopen(vim.o.shell)
            M.buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_name(M.buf, "Terminal")
            vim.cmd.set("nonu")
        else
            vim.api.nvim_set_current_buf(M.buf)
        end
        M.open = true
        vim.cmd.startinsert()
    else
        vim.cmd.tabclose()
        M.open = false
    end
end

return M
