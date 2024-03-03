local create_command = vim.api.nvim_create_user_command

create_command("Scratch", function()
    vim.cmd.new()
    vim.cmd.on()
end, { desc = "Create and focus on a new scratch buffer" })
