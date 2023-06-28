local autocmd = vim.api.nvim_create_autocmd


autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load options
require("set")

-- load lazy.nvim
require("lazy").setup("plugins")

-- load keymaps
require("remap")

local function SetTheme(theme)
	local config_path = "config.themes." .. theme
	local exists, config = pcall(require, config_path)

	if not exists then
		print("Theme .lua file not found in /config/themes")
	else
		require(theme).setup(config)
		vim.cmd("colorscheme " .. theme)
	end
end

SetTheme("tokyonight")
