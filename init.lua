require("core")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

local FormatOnSave = augroup("FormatOnSave", { clear = true })
autocmd("BufWritePost", {
	pattern = "*.go",
	callback = function()
		local path = vim.fn.expand("<amatch>")
		vim.cmd("silent !gofmt -w " .. path)
	end,
	group = FormatOnSave
})
