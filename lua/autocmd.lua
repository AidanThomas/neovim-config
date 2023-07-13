local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})
