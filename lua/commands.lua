local create_command = vim.api.nvim_create_user_command

create_command("Scratch", function()
    vim.cmd.new()
    vim.cmd.on()
end, { desc = "Create and focus on a new scratch buffer" })

-- Protect against typos
create_command("Q", function()
    vim.cmd.q()
end, { desc = "Protect against typos" })
create_command("WQ", function()
    vim.cmd.wq()
end, { desc = "Protect against typos" })
create_command("Wq", function()
    vim.cmd.wq()
end, { desc = "Protect against typos" })
create_command("QA", function()
    vim.cmd.qa()
end, { desc = "Protect against typos" })
create_command("Qa", function()
    vim.cmd.qa()
end, { desc = "Protect against typos" })
