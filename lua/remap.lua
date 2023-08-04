local function RegisterMapping(mappings)
	local wk = require("which-key")
	wk.register(mappings)
end

local gs = package.loaded.gitsigns

local keymaps = {
	["n"] = {
		-- Navigation
		["<leader>pv"] = { vim.cmd.Ex, "Open file explorer" },
		["<C-s>"] = { "<cmd>w<CR>", "Save current file", noremap = true },
		["<leader>qq"] = { "<cmd>qall<CR>", "Quit all buffers" },
		["<leader>qw"] = { "<cmd>wqall<CR>", "Write and quit all buffers" },
		["<leader>n"] = { "<cmd>NvimTreeToggle<CR>", "Toggle file tree" },
		["<C-d>"] = { "<C-d>zz", "Scroll down" },
		["<C-u>"] = { "<C-u>zz", "Scroll up" },
		["<leader>es"] = { ":e $MYVIMRC | :cd %:p:h <CR>", "Edit vimrc" },
		["<leader>rd"] = { "<cmd>Alpha<CR>", "Return to dashboard" },
		["<leader>gs"] = { vim.cmd.Git, "Open fugitive" },
		["<leader>u"] = { vim.cmd.UndotreeToggle, "Open undo tree" },

		-- Splitting
		["<leader>v"] = { "<cmd>vsplit<CR>", "Vertically split the current file" },
		["<leader>h"] = { "<cmd>split<CR>", "Horizontally split the currentl file" },

		-- Trouble keybinds
		["<leader>tt"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggles Trouble UI" },
		["<leader>tr"] = { "<cmd>TroubleToggle lsp_references<CR>", "Toggles Trouble references" },
		["<leader>tq"] = { "<cmd>TroubleToggle quickfix<CR>", "Toggles Trouble references" },

		-- Tab controls
		["<tab>"] = { "<cmd>bnext<CR>", "Move to next tab" },
		["<S-tab>"] = { "<cmd>bprev<CR>", "Move to prev tab" },
		["<leader>x"] = { "<cmd>bdelete<CR>", "Close current tab" },
		["<leader>xl"] = { "<cmd>BufferLineCloseLeft<CR>", "Close tabs to the left" },
		["<leader>xr"] = { "<cmd>BufferLineCloseRight<CR>", "Close tabs to the right" },
		["<leader>xa"] = { function()
			vim.cmd("BufferLineCloseLeft")
			vim.cmd("BufferLineCloseRight")
		end, "Close all other tabs" },

		-- Switch between windows
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },


		["n"] = { "nzzzv", "Move to next search result" },
		["N"] = { "Nzzzv", "Move to prev search result" },

		-- Copy/Paste
		["<leader>y"] = { [["+y]], "Copy to clipboard" },
		["<leader>Y"] = { [["+Y]], "Copy to clipboard" },

		-- LSP commands
		["<leader>f"] = { vim.lsp.buf.format, "LSP format" },
		["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Rename symbol underneath" },
		["<leader>rn"] = { function()
			vim.wo.number = true
			vim.wo.relativenumber = not vim.wo.relativenumber
		end, "Toggle relative numbers" },

		["<leader>t"] = { ":lua require('toggle-checkbox').toggle()<CR>", "Toggle markdown checkbox" },

		-- Debugging
		["<F5>"] = { ":lua require'dap'.continue()<CR>", "Start debugging/Continue" },
		["<F10>"] = { ":lua require'dap'.step_over()<CR>", "Step over" },
		["<F11>"] = { ":lua require'dap'.step_into()<CR>", "Step into" },
		["<F12>"] = { ":lua require'dap'.step_out()<CR>", "Step out" },
		["<leader>b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		["<leader>B"] = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"Set breakpoint with conidition" },
		["<leader>lp"] = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			"Set log point" },
		["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", "repl.open" },
		["<leader>dbg"] = { ":lua require('dap-go').debug_test()<CR>", "Debug test" },
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
		["<leader>Y"] = { [["+Y]], "Copy to clipboard" },

	},

	["t"] = {
		["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
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
