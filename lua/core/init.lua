require("core.remap")
require("core.set")
require("core.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

CustomHighlights = augroup("CustomHighlights", { clear = true })
autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight String guifg=#b4be82")
		vim.cmd("highlight Type guifg=#a093c7")
		vim.cmd("highlight Statement guifg=#729dd8")
		vim.cmd("highlight Function guifg=#729dd8")
	end})

vim.cmd("colorscheme iceberg")
