local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- load options
require("set")

-- load lazy.nvim
require("lazy").setup("plugins")

-- load keymaps
require("remap")

require("autocmd")

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
