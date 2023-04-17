require("core.remap")
require("core.set")
require("core.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

CustomHighlights = augroup("CustomHighlights", { clear = true })
autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight String guifg=#e87979")
	end})

vim.cmd("colorscheme iceberg")
