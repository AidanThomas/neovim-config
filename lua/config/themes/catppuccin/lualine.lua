-- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/utils/lualine.lua
local colours = require("catppuccin.palettes").get_palette("mocha")

return {
    normal = {
        a = { bg = colours.blue, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.blue },
        c = { bg = colours.crust, fg = colours.text },
    },
    insert = {
        a = { bg = colours.green, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.green },
        c = { bg = colours.crust, fg = colours.text },
    },
    terminal = {
        a = { bg = colours.green, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.green },
        c = { bg = colours.crust, fg = colours.text },
    },
    command = {
        a = { bg = colours.peach, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.peach },
        c = { bg = colours.crust, fg = colours.text },
    },
    visual = {
        a = { bg = colours.mauve, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.mauve },
        c = { bg = colours.crust, fg = colours.text },
    },
    replace = {
        a = { bg = colours.red, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.red },
        c = { bg = colours.crust, fg = colours.text },
    },
    inactive = {
        a = { bg = colours.crust, fg = colours.blue },
        b = { bg = colours.crust, fg = colours.surface1, gui = "bold" },
        c = { bg = colours.crust, fg = colours.overlay0 },
    },
}
