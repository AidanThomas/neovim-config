require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = true,     -- shows the '~' characters after the end of buffers
    term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },   -- Change the style of comments
        conditionals = { "italic" },
        types = { "italic" },
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    custom_highlights = function(colors)
        return {
            -- Normal = { bg = colors.crust },
            -- NormalNC = { bg = colors.crust },
            WinSeparator = { fg = colors.base },
            FloatTitle = {
                fg = colors.blue,
                -- bg = colors.mantle
            },
            TroubleNormal = { bg = colors.mantle },
            TroubleNormalNC = { bg = colors.mantle },
            TelescopeNormal = { bg = colors.crust },
            TelescopeBorder = { fg = colors.blue, bg = colors.crust },
            AlphaHeader = { fg = colors.flamingo },
            DapBreakpoint = { fg = colors.red },
        }
    end,
    integrations = {
        blink_cmp = true,
        fzf = true,
        gitsigns = true,
        treesitter = true,
        alpha = true,
        harpoon = true,
        indent_blankline = {
            enabled = true,
        },
        mason = true,
        dap_ui = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
            inlay_hints = {
                background = true,
            }
        },
        navic = {
            enabled = true,
            custom_bg = "NONE",
        },
        telescope = {
            enabled = false,
        },
        lsp_trouble = true,
    },

})
