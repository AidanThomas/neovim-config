-- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/utils/lualine.lua
local colours = require("catppuccin.palettes").get_palette("mocha")

return {
    normal = {
        a = { bg = colours.blue, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.blue },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.text },
    },
    insert = {
        a = { bg = colours.green, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.green },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.text },
    },
    terminal = {
        a = { bg = colours.green, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.green },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.text },
    },
    command = {
        a = { bg = colours.peach, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.peach },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.text },
    },
    visual = {
        a = { bg = colours.mauve, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.mauve },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.text },
    },
    replace = {
        a = { bg = colours.red, fg = colours.crust, gui = "bold" },
        b = { bg = colours.base, fg = colours.red },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.text },
    },
    inactive = {
        a = { bg = colours.crust, fg = colours.blue },
        b = { bg = colours.crust, fg = colours.surface1, gui = "bold" },
        -- we set to "none" where we want transparecny, probably a cleaner way to do this...
        c = { bg = "none", fg = colours.overlay0 },
    },
}
