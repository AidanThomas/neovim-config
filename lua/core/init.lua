require("core.remap")
require("core.set")
require("core.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

CustomHighlights = augroup("CustomHighlights", { clear = true })

-- Autocmd for customising "iceberg" theme
-- autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd("highlight String guifg=#b4be82")
-- 		vim.cmd("highlight Type guifg=#a093c7")
-- 		vim.cmd("highlight Statement guifg=#729dd8")
-- 		vim.cmd("highlight Function guifg=#729dd8")
-- 	end})

function SetTheme(theme)
	local config_path = "core.config." .. theme
	local exists, config = pcall(require, config_path)

	if not exists then
		print("Theme .lua file not found in /core/config")
	else
		require(theme).setup(config)
		vim.cmd("colorscheme " .. theme)
	end
end

SetTheme("tokyonight")
