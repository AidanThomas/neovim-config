require("core.remap")
require("core.set")
require("core.packer")

function SetTheme(theme)
	local config_path = "core.config.themes." .. theme
	local exists, config = pcall(require, config_path)

	if not exists then
		print("Theme .lua file not found in /core/config/themes")
	else
		require(theme).setup(config)
		vim.cmd("colorscheme " .. theme)
	end
end

SetTheme("tokyonight")
