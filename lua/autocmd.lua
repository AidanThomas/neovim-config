local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

augroup("AutoFolds", { clear = true })
autocmd("BufReadPost", {
	group = "AutoFolds",
	pattern = "*.*",
	desc = "Load any created folds",
	command = "loadview",
})
autocmd("BufWritePost", {
	group = "AutoFolds",
	pattern = "*.*",
	desc = "Save any folds",
	command = "mkview",
})
