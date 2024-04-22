local keymaps = {
    ["n"] = {
        -- Saving/Quitting
        ["<C-s>"] = { "<cmd>w<CR>", { desc = "Save current file", noremap = true } },
        ["<leader>qq"] = { "<cmd>qall<CR>", { desc = "Quit all buffers" } },
        ["<leader>qw"] = { "<cmd>wqall<CR>", { desc = "Write and quit all buffers" } },

        -- Navigation
        ["<C-d>"] = { "<C-d>zz", { desc = "Scroll down" } },
        ["<C-u>"] = { "<C-u>zz", { desc = "Scroll up" } },
        ["<leader>es"] = { ":Telescope find_files cwd=~/.config/nvim<CR>", { desc = "Show configuration files" } },
        ["<leader>cwd"] = { ":cd %:p:h <CR>", { desc = "Set current working directory" } },
        ["<leader>u"] = { vim.cmd.UndotreeToggle, { desc = "Open undo tree" } },
        ["<leader>n"] = { vim.cmd.Navbuddy, { desc = "Open Navdbuddy" } },

        -- Telescope
        ["<leader>pv"] = { function()
            require("telescope").extensions.file_browser.file_browser({
                grouped = true,
                hidden = true,
                select_buffer = true,
                cwd = vim.fn.expand("%:h")
            })
        end, { desc = "Open file explorer" } },
        ["<leader>ph"] = { function()
            require("telescope.builtin").help_tags()
        end, { desc = "Open help" } },
        ["<leader>ff"] = { function()
            require("telescope.builtin").find_files()
        end, { desc = "Find files" } },
        ["<leader>ps"] = { function()
            require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Find by grep" } },
        ["<leader>fb"] = { function()
            require("telescope.builtin").buffers()
        end, { desc = "Find buffers" } },

        -- Harpoon/Tabs
        ["<leader>hp"] = { [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], { desc = "Toggle harpoon menu" } },
        ["<leader>ha"] = { function() require("harpoon.mark").add_file() end, { desc = "Add file to harpoon" } },
        ["<A-a>"] = { function() require("harpoon.ui").nav_file(1) end, { desc = "Navigate to pooned file 1" } },
        ["<A-s>"] = { function() require("harpoon.ui").nav_file(2) end, { desc = "Navigate to pooned file 2" } },
        ["<A-d>"] = { function() require("harpoon.ui").nav_file(3) end, { desc = "Navigate to pooned file 3" } },
        ["<A-f>"] = { function() require("harpoon.ui").nav_file(4) end, { desc = "Navigate to pooned file 4" } },
        ["<Tab>"] = { vim.cmd.bnext, { desc = "Next buffer" } },
        ["<S-Tab>"] = { vim.cmd.bprev, { desc = "Next buffer" } },

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

        -- Splitting
        ["<leader>vs"] = { "<cmd>vsplit<CR>", { desc = "Vertically split the current file" } },
        ["<leader>hs"] = { "<cmd>split<CR>", { desc = "Horizontally split the currentl file" } },

        -- Terminal
        ["<A-i>"] = { function() require("custom.terminal").toggle() end, { desc = "Toggle terminal" } },

        -- Trouble keybinds
        ["<leader>tt"] = { "<cmd>Trouble diagnostics<CR>", { desc = "Toggles Trouble diagnostics" } },
        ["<leader>tr"] = { "<cmd>Trouble lsp_references<CR>", { desc = "Toggles Trouble references" } },
        ["<leader>tq"] = { "<cmd>Trouble quickfix<CR>", { desc = "Toggles Trouble quickfix" } },
        ["<leader>ti"] = { "<cmd>Trouble lsp_implementations<CR>", { desc = "Toggles Trouble implementations" } },
        ["<leader>tp"] = { "<cmd>Trouble<CR>", { desc = "Toggles Trouble picker" } },

        -- Debugging
        ["<F5>"] = { ":lua require'dap'.continue()<CR>", { desc = "Start debugging/Continue" } },
        ["<F6>"] = { ":lua require'dap'.step_over()<CR>", { desc = "Step over" } },
        ["<F7>"] = { ":lua require'dap'.step_into()<CR>", { desc = "Step into" } },
        ["<F8>"] = { ":lua require'dap'.step_out()<CR>", { desc = "Step out" } },
        ["<leader>b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" } },
        ["<leader>B"] = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            { desc = "Set breakpoint with conidition" } },
        ["<leader>lp"] = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
            { desc = "Set log point" } },
        ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", { desc = "repl.open" } },
        ["<leader>dbg"] = { ":lua require('dap-go').debug_test()<CR>", { desc = "Debug test" } },

        -- Diagnostics
        ["<leader>df"] = { function() vim.diagnostic.open_float() end, { desc = "Open diagnostic as float" } },
        ["]d"] = { function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" } },
        ["[d]"] = { function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" } },
    },

    ["i"] = {
        ["<A-h>"] = { "<Left>", { desc = "Move left" } },
        ["<A-l>"] = { "<Right>", { desc = "Move right" } },
        ["<A-j>"] = { "<Down>", { desc = "Move down" } },
        ["<A-k>"] = { "<Up>", { desc = "Move up" } },

        ["jk"] = { "<ESC>", { desc = "Stephen is always right" } }
    },

    ["v"] = {
        -- Highlight all
        ["<leader>a"] = { "<ESC>ggVG", { desc = "Highlight all lines in file" } },

        -- Move commands
        ["J"] = { ":m '>+1<CR>gv=gv", { desc = "Move highlighted line down" } },
        ["K"] = { ":m '<-2<CR>gv=gv", { desc = "Move highlighted line up" } },

        -- Copy/Paste
        ["<leader>y"] = { [["+y]], { desc = "Copy to clipboard" } },
    },

    ["t"] = {
        ["<Esc>"] = { "<C-\\><C-n>", { desc = "Exit terminal mode" } },
        ["<A-i>"] = { function() require("custom.terminal").toggle() end, { desc = "Toggle terminal" } },
    },

    ["x"] = {
        ["<leader>p"] = { [["_dP]], { desc = "Paste over and delete" } },
    },
}

require("custom.utils").register_mappings(keymaps)
