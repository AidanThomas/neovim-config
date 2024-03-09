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

-- Set options
require("set")
require("remap")
require("autocmd")
require("commands")

-- Start lazy
require("config.lazy")

-- Set colourscheme, see lua/config/themes
vim.cmd.colorscheme("catppuccin")
