local function RegisterMapping(mappings)
	local wk = require("which-key")
	wk.register(mappings)
end

local keymaps = {
	["n"] = {
		-- Navigation
		["<leader>pv"] = { function()
			require("telescope").extensions.file_browser.file_browser({
				grouped = true,
				hidden = true,
			})
		end, "Open file explorer" },
		["<C-s>"] = { "<cmd>w<CR>", "Save current file", noremap = true },
		["<leader>qq"] = { "<cmd>qall<CR>", "Quit all buffers" },
		["<leader>qw"] = { "<cmd>wqall<CR>", "Write and quit all buffers" },
		["<leader>n"] = { vim.cmd.NvimTreeToggle, "Toggle file tree" },
		["<C-d>"] = { "<C-d>zz", "Scroll down" },
		["<C-u>"] = { "<C-u>zz", "Scroll up" },
		["<leader>es"] = { ":Telescope find_files cwd=~/.config/nvim<CR>", "Show configuration files" },
		["<leader>cwd"] = { ":cd %:p:h <CR>", "Set current working directory" },
		["<leader>rd"] = { "<cmd>Alpha<CR>", "Return to dashboard" },
		["<leader>gs"] = { vim.cmd.Git, "Open fugitive" },
		["<leader>u"] = { vim.cmd.UndotreeToggle, "Open undo tree" },

		-- -- Tab controls
		-- ["<tab>"] = { "<cmd>bnext<CR>", "Move to next tab" },
		-- ["<S-tab>"] = { "<cmd>bprev<CR>", "Move to prev tab" },
		-- ["<leader>x"] = { "<cmd>bdelete<CR>", "Close current tab" },
		-- ["<leader>xl"] = { "<cmd>BufferLineCloseLeft<CR>", "Close tabs to the left" },
		-- ["<leader>xr"] = { "<cmd>BufferLineCloseRight<CR>", "Close tabs to the right" },
		-- ["<leader>xa"] = { function()
		-- 	vim.cmd("BufferLineCloseLeft")
		-- 	vim.cmd("BufferLineCloseRight")
		-- end, "Close all other tabs" },

		-- Harpoon
		["<leader>hp"] = { [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], "Toggle harpoon menu" },
		["<leader>ha"] = { function() require("harpoon.mark").add_file() end, "Add file to harpoon" },
		["<tab>"] = { function() require("harpoon.ui").nav_next() end, "Navigate to next pooned file" },
		["<S-tab>"] = { function() require("harpoon.ui").nav_prev() end, "Navigate to prev pooned file" },
		["<A-a>"] = { function() require("harpoon.ui").nav_file(1) end, "Navigate to pooned file 1" },
		["<A-s>"] = { function() require("harpoon.ui").nav_file(2) end, "Navigate to pooned file 2" },
		["<A-d>"] = { function() require("harpoon.ui").nav_file(3) end, "Navigate to pooned file 3" },
		["<A-f>"] = { function() require("harpoon.ui").nav_file(4) end, "Navigate to pooned file 4" },

		-- Switch between windows
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },


		["<Esc>"] = { vim.cmd.noh, "Turn off search highlights" },
		["n"] = { "nzzzv", "Move to next search result" },
		["N"] = { "Nzzzv", "Move to prev search result" },

		-- Copy/Paste
		["<leader>y"] = { [["+y]], "Copy to clipboard" },
		["<leader>Y"] = { [["+Y]], "Copy to clipboard" },

		-- Splitting
		["<leader>v"] = { "<cmd>vsplit<CR>", "Vertically split the current file" },
		["<leader>h"] = { "<cmd>split<CR>", "Horizontally split the currentl file" },

		-- Terminal
		["<A-h>"] = { function() require("nvterm.terminal").toggle("horizontal") end, "Toggle horizontal terminal" },
		["<A-v>"] = { function() require("nvterm.terminal").toggle("vertical") end, "Toggle vertical terminal" },
		["<A-i>"] = { function() require("nvterm.terminal").toggle("float") end, "Toggle floating terminal" },

		-- Manipulation
		["<C-o>"] = { "o<Esc>k", "Add an empty line below" },

		-- Scratchpad
		["<leader>sp"] = { function() require("scratchpad").toggle() end, "Open new scratchpad" },

		-- Telescope
		["<leader>ff"] = { function()
			require("telescope.builtin").find_files()
		end, "Find files" },
		["<C-p>"] = { function() require("telescope.builtin").git_files() end, "Find Git files" },
		["<leader>ps"] = { function()
			require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
		end, "Find by grep" },


		-- Trouble keybinds
		["<leader>tt"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggles Trouble UI" },
		["<leader>tr"] = { "<cmd>TroubleToggle lsp_references<CR>", "Toggles Trouble references" },
		["<leader>tq"] = { "<cmd>TroubleToggle quickfix<CR>", "Toggles Trouble references" },


		-- LSP commands
		["<leader>f"] = { vim.lsp.buf.format, "LSP format" },
		["<leader>rn"] = { function()
			vim.wo.number = true
			vim.wo.relativenumber = not vim.wo.relativenumber
		end, "Toggle relative numbers" },

		["<leader>t"] = { ":lua require('toggle-checkbox').toggle()<CR>", "Toggle markdown checkbox" },

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
		["<C-b>"] = { "<ESC>^i", "Beginning of line" },
		["<C-h>"] = { "<Left>", "Move left", noremap = true },
		["<C-l>"] = { "<Right>", "Move right" },
		["<C-j>"] = { "<Down>", "Move down" },
		["<C-k>"] = { "<Up>", "Move up" },
	},

	["v"] = {
		-- Highlight all
		["<leader>a"] = { "<ESC>ggVG", "Highlight all lines in file" },

		-- Move commands
		["J"] = { ":m '>+1<CR>gv=gv", "Move highlighted line down" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move highlighted line up" },

		-- Copy/Paste
		["<leader>y"] = { [["+y]], "Copy to clipboard" },

	},

	["t"] = {
		["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
		["<A-h>"] = { function() require("nvterm.terminal").toggle("horizontal") end, "Toggle horizontal terminal" },
		["<A-v>"] = { function() require("nvterm.terminal").toggle("vertical") end, "Toggle vertical terminal" },
		["<A-i>"] = { function() require("nvterm.terminal").toggle("float") end, "Toggle floating terminal" },
	},

	["x"] = {
		["<leader>p"] = { [["_dP]], "Paste over and delete" },
	}
}

for mode, mappings in pairs(keymaps) do
	local processed = {}
	for mapping, action in pairs(mappings) do
		processed[mapping] = action
		processed[mapping].mode = mode
	end
	RegisterMapping(processed)
end
