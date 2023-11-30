local function RegisterMappings(mappings)
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

local keymaps = {
	["n"] = {
		-- Navigation
		["<leader>pv"] = { function()
			require("telescope").extensions.file_browser.file_browser({
				grouped = true,
				hidden = true,
			})
		end, { desc = "Open file explorer" } },
		["<C-s>"] = { "<cmd>w<CR>", { desc = "Save current file", noremap = true } },
		["<leader>qq"] = { "<cmd>qall<CR>", { desc = "Quit all buffers" } },
		["<leader>qw"] = { "<cmd>wqall<CR>", { desc = "Write and quit all buffers" } },
		["<C-d>"] = { "<C-d>zz", { desc = "Scroll down" } },
		["<C-u>"] = { "<C-u>zz", { desc = "Scroll up" } },
		["<leader>es"] = { ":Telescope find_files cwd=~/.config/nvim<CR>", { desc = "Show configuration files" } },
		["<leader>cwd"] = { ":cd %:p:h <CR>", { desc = "Set current working directory" } },
		["<leader>gs"] = { vim.cmd.Git, { desc = "Open fugitive" } },
		["<leader>u"] = { vim.cmd.UndotreeToggle, { desc = "Open undo tree" } },

		-- Harpoon
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


		["<Esc>"] = { vim.cmd.noh, { desc = "Turn off search highlights" } },
		["n"] = { "nzzzv", { desc = "Move to next search result" } },
		["N"] = { "Nzzzv", { desc = "Move to prev search result" } },

		-- Copy/Paste
		["<leader>y"] = { [["+y]], { desc = "Copy to clipboard" } },

		-- Splitting
		["<leader>v"] = { "<cmd>vsplit<CR>", { desc = "Vertically split the current file" } },
		["<leader>h"] = { "<cmd>split<CR>", { desc = "Horizontally split the currentl file" } },

		-- Terminal
		["<A-h>"] = { function() require("nvterm.terminal").toggle("horizontal") end, {
			desc = "Toggle horizontal terminal" } },
		["<A-v>"] = { function() require("nvterm.terminal").toggle("vertical") end, { desc = "Toggle vertical terminal" } },
		["<A-i>"] = { function() require("nvterm.terminal").toggle("float") end, { desc = "Toggle floating terminal" } },

		-- Scratchpad
		["<leader>sp"] = { function() require("scratchpad").toggle() end, { desc = "Open new scratchpad" } },

		-- Telescope
		["<leader>ff"] = { function()
			require("telescope.builtin").find_files()
		end, { desc = "Find files" } },
		["<leader>ps"] = { function()
			require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Find by grep" } },


		-- Trouble keybinds
		["<leader>tt"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Toggles Trouble UI" } },
		["<leader>tr"] = { "<cmd>TroubleToggle lsp_references<CR>", { desc = "Toggles Trouble references" } },
		["<leader>tq"] = { "<cmd>TroubleToggle quickfix<CR>", { desc = "Toggles Trouble references" } },


		-- LSP commands
		["<leader>rn"] = { function()
			vim.wo.number = true
			vim.wo.relativenumber = not vim.wo.relativenumber
		end, { desc = "Toggle relative numbers" } },

		-- Debugging
		-- ["<F5>"] = { ":lua require'dap'.continue()<CR>", "Start debugging/Continue" },
		-- ["<F6>"] = { ":lua require'dap'.step_over()<CR>", "Step over" },
		-- ["<F7>"] = { ":lua require'dap'.step_into()<CR>", "Step into" },
		-- ["<F8>"] = { ":lua require'dap'.step_out()<CR>", "Step out" },
		-- ["<leader>b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		-- ["<leader>B"] = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
		-- 	"Set breakpoint with conidition" },
		-- ["<leader>lp"] = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
		-- 	"Set log point" },
		-- ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", "repl.open" },
		-- ["<leader>dbg"] = { ":lua require('dap-go').debug_test()<CR>", "Debug test" },
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
		["<A-h>"] = { function() require("nvterm.terminal").toggle("horizontal") end, {
			desc = "Toggle horizontal terminal" } },
		["<A-v>"] = { function() require("nvterm.terminal").toggle("vertical") end, { desc = "Toggle vertical terminal" } },
		["<A-i>"] = { function() require("nvterm.terminal").toggle("float") end, { desc = "Toggle floating terminal" } },
	},

	["x"] = {
		["<leader>p"] = { [["_dP]], { desc = "Paste over and delete" } },
	}
}

RegisterMappings(keymaps)
