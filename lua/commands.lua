local create_command = vim.api.nvim_create_user_command

create_command("Scratch", function()
    vim.cmd.new()
    vim.cmd.on()
    vim.cmd.setlocal("filetype=markdown")
end, { desc = "Create and focus on a new scratch buffer" })

create_command("DockerUp", function()
    vim.notify = require("mini.notify").make_notify()
    local finished = false
    local timer = vim.uv.new_timer()
    local timer_count = 0

    local on_exit = function(obj)
        finished = true
        local out = tostring(obj.stdout)
        local err = tostring(obj.stderr)
        if obj.code ~= 0 then
            vim.notify(err, vim.log.levels.ERROR)
        else
            vim.notify(out)
        end
    end

    local function check()
        if not finished then
            timer_count = timer_count + 1
            vim.notify("Running docker compose for " .. tostring(timer_count * 2) .. " seconds...")
            timer:start(2000, 0, check)
        else
            timer:stop()
        end
    end

    vim.system({ 'docker', 'compose', 'up', '--build', '-d' }, { text = true }, on_exit)
    vim.notify("Started docker compose")
    timer:start(2000, 0, check)
end, { desc = "Start the docker compose container(s)" })

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
