vim.opt.nu = true
vim.opt.relativenumber = true

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

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.opt.mousemoveevent = true

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

vim.g.mapleader = " "
