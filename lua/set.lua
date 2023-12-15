vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.cursorline = true

local home_dir = os.getenv("HOME")
if home_dir ~= nil then
	vim.opt.undodir = home_dir .. "/.vim/undodir"
end

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.mapleader = " "

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Hint",
	},
	update_in_insert = true,
})

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.o.cmdheight = 0
