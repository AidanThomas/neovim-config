local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Install lazy if it is not found
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("set")
require("config.lazy")
require("autocmd")

-- Keymaps
local r = require("remap")
r.RegisterMappings(r.keymaps, { noremap = true, silent = true })

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
