local function RegisterMapping(mappings)
	local wk = require("which-key")
	wk.register(mappings)
end

local mappings = {
	-- Navigation
	["<leader>pv"] = { vim.cmd.Ex, "Open file explorer", mode = "n" },
	["<C-s>"] = { "<cmd>w<CR>", "Save current file", mode = "n", noremap = true },
	["<leader>qq"] = { "<cmd>qall<CR>", "Quit all buffers", mode = "n" },
	["<leader>qw"] = { "<cmd>wqall<CR>", "Write and quit all buffers", mode = "n" },
	["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode", mode = "t" },
	["<leader>n"] = { "<cmd>NvimTreeToggle<CR>", "Toggle file tree", mode = "n" },
	["<C-d>"] = { "<C-d>zz", "Scroll down", mode = "n" },
	["<C-u>"] = { "<C-u>zz", "Scroll up", mode = "n" },
	["<C-b>"] = { "<ESC>^i", "Beginning of line", mode = "i" },
	["<C-e>"] = { "<End>", "End of line", mode = "i" },
	["<leader>es"] = { ":e $MYVIMRC | :cd %:p:h <CR>", "Edit vimrc", mode = "n" },
	["<leader>rd"] = { "<cmd>Alpha<CR>", "Return to dashboard", mode = "n" },
	["<leader>gs"] = { vim.cmd.Git, "Open fugitive", mode = "n" },
	["<leader>u"] = { vim.cmd.UndoTreeToggle, "Open undo tree", mode = "n" },

	-- Tab controls
	["<tab>"] = { "<cmd>bnext<CR>", "Move to next tab", mode = "n" },
	["<S-tab>"] = { "<cmd>bprev<CR>", "Move to prev tab", mode = "n" },
	["<leader>x"] = { "<cmd>bdelete<CR>", "Close current tab", mode = "n" },
	["<leader>xl"] = { "<cmd>BufferLineCloseLeft<CR>", "Close tabs to the left", mode = "n" },
	["<leader>xr"] = { "<cmd>BufferLineCloseRight<CR>", "Close tabs to the right", mode = "n" },
	["<leader>xa"] = { function()
		vim.cmd("BufferLineCloseLeft")
		vim.cmd("BufferLineCloseRight")
	end, "Close all other tabs", mode = "n" },

	-- Highlight all
	["<leader>a"] = { "<ESC>ggVG", "Highlight all lines in file", mode = "v" },

	-- Switch between windows
	["<C-h>"] = { "<C-w>h", "Window left", mode = "n" },
	["<C-l>"] = { "<C-w>l", "Window right", mode = "n" },
	["<C-j>"] = { "<C-w>j", "Window down", mode = "n" },
	["<C-k>"] = { "<C-w>k", "Window up", mode = "n" },

	-- Move commands
	["J"] = { ":m '>+1<CR>gv=gv", "Move highlighted line down", mode = "v" },
	["K"] = { ":m '<-2<CR>gv=gv", "Move highlighted line up", mode = "v" },
	["n"] = { "nzzzv", "Move to next search result", mode = "n" },
	["N"] = { "Nzzzv", "Move to prev search result", mode = "n" },

	-- Copy/Paste
	["<leader>p"] = { [["_dP]], "Paste over and delete", mode = "x" },
	["<leader>y"] = { [["+y]], "Copy to clipboard", mode = { "n", "v" } },
	["<leader>Y"] = { [["+Y]], "Copy to clipboard", mode = { "n", "v" } },

	-- LSP commands
	["<leader>f"] = { vim.lsp.buf.format, "LSP format", mode = "n" },
	["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Rename symbol underneath", mode = "n" },
	["<leader>rn"] = { function()
		vim.wo.number = true
		vim.wo.relativenumber = not vim.wo.relativenumber
	end, "Toggle relative numbers", mode = "n" }
}

RegisterMapping(mappings)
