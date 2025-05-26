local keymaps = {
    ["n"] = {
        -- Saving/Quitting
        ["<C-s>"] = { "<cmd>w<CR>", { desc = "Save current file", noremap = true } },
        ["<leader>qq"] = { "<cmd>qall<CR>", { desc = "Quit all buffers" } },
        ["<leader>qw"] = { "<cmd>wqall<CR>", { desc = "Write and quit all buffers" } },

        -- Navigation
        ["<C-d>"] = { "<C-d>zz", { desc = "Scroll down" } },
        ["<C-u>"] = { "<C-u>zz", { desc = "Scroll up" } },
        ["<leader>es"] = { ":FzfLua files cwd=~/.config/nvim<CR>", { desc = "Show configuration files" } },
        ["<leader>cwd"] = { ":cd %:p:h <CR>", { desc = "Set current working directory" } },
        ["<leader>u"] = { vim.cmd.UndotreeToggle, { desc = "Open undo tree" } },
        ["<leader>n"] = { vim.cmd.Navbuddy, { desc = "Open Navdbuddy" } },
        ["<leader>j"] = { function() vim.cmd.Rabbit("history") end, { desc = "Open rabbit history" } },

        -- Folds
        ["<Tab>"] = { "za", { desc = "Toggle folds" } },

        -- Quickfix
        ["<M-j>"] = { vim.cmd.cnext, { desc = "Next quickfix" } },
        ["<M-k>"] = { vim.cmd.cprev, { desc = "Prev quickfix" } },
        ["∆"] = { vim.cmd.cnext, { desc = "Next quickfix" } },
        ["˚"] = { vim.cmd.cprev, { desc = "Prev quickfix" } },

        -- Oil
        ["<leader>pv"] = { ":Oil<CR>", { desc = "Open file explorer" } },

        -- FzfLua
        ["<leader>fh"] = { function() vim.cmd.FzfLua("helptags") end, { desc = "Open help" } },
        ["<leader>ff"] = { function() vim.cmd.FzfLua("files") end, { desc = "Find files" } },
        ["<leader>fg"] = { function() vim.cmd.FzfLua("grep") end, { desc = "Find files" } },
        ["<leader>fb"] = { function() vim.cmd.FzfLua("buffers") end, { desc = "Find buffers" } },
        ["<leader>fc"] = { function() vim.cmd.FzfLua("git_commit") end, { desc = "Find commit" } },
        ["<leader>fm"] = { function() vim.cmd.FzfLua("marks") end, { desc = "Find marks" } },
        ["<leader>wk"] = { function() vim.cmd.FzfLua("keymaps") end, { desc = "Find keymaps" } },
        ["<leader>gd"] = { function() vim.cmd.FzfLua("lsp_workspace_diagnostics") end, { desc = "Show diagnostics" } },
        ["grr"] = { function() vim.cmd.FzfLua("lsp_references") end, { desc = "Find references" } },
        ["gri"] = { function() vim.cmd.FzfLua("lsp_implementations") end, { desc = "Find implementations" } },

        -- Switch between windows
        ["<C-h>"] = { "<C-w>h", { desc = "Window left" } },
        ["<C-l>"] = { "<C-w>l", { desc = "Window right" } },
        ["<C-j>"] = { "<C-w>j", { desc = "Window down" } },
        ["<C-k>"] = { "<C-w>k", { desc = "Window up" } },

        -- Git
        ["<leader>gs"] = { vim.cmd.Git, { desc = "Open fugitive" } },

        -- Searching
        ["<Esc>"] = { vim.cmd.noh, { desc = "Turn off search highlights" } },
        ["n"] = { "nzzzv", { desc = "Move to next search result" } },
        ["N"] = { "Nzzzv", { desc = "Move to prev search result" } },

        -- Copy/Paste
        ["<leader>y"] = { [["+y]], { desc = "Copy to clipboard" } },

        -- Debugging
        ["<C-5>"] = { ":lua require'dap'.continue()<CR>", { desc = "Start debugging/Continue" } },
        ["<C-6>"] = { ":lua require'dap'.step_over()<CR>", { desc = "Step over" } },
        ["<C-7>"] = { ":lua require'dap'.step_into()<CR>", { desc = "Step into" } },
        ["<C-8>"] = { ":lua require'dap'.step_out()<CR>", { desc = "Step out" } },
        ["<leader>b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" } },
        ["<leader>B"] = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            { desc = "Set breakpoint with conidition" } },
        ["<leader>lp"] = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
            { desc = "Set log point" } },
        ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", { desc = "repl.open" } },
        ["<leader>dbg"] = { ":lua require('dap-go').debug_test()<CR>", { desc = "Debug test" } },

        -- Diagnostics
        ["<leader>df"] = { function() vim.diagnostic.open_float() end, { desc = "Open diagnostic as float" } },
    },

    ["i"] = {
        ["jk"] = { "<ESC>", { desc = "Stephen is always right" } }
    },

    ["v"] = {
        -- Highlight all
        ["<leader>a"] = { "<ESC>ggVG", { desc = "Highlight all lines in file" } },

        -- Copy/Paste
        ["<leader>y"] = { [["+y]], { desc = "Copy to clipboard" } },
    },

    ["t"] = {
        ["<Esc>"] = { "<C-\\><C-n>", { desc = "Exit terminal mode" } },
        ["<A-i>"] = { function() require("custom.terminal").toggle() end, { desc = "Toggle terminal" } },
        ["<D-i>"] = { function() require("custom.terminal").toggle() end, { desc = "Toggle terminal" } },
    },

    ["x"] = {
        ["<leader>p"] = { [["_dP]], { desc = "Paste over and delete" } },
    },
}

require("custom.utils").register_mappings(keymaps)
