require("Comment").setup({
    -- Add a space between comment and line
    padding = true,
    -- Whether the cursor should stay at its position
    sticky = true,
    -- LHS of toggles mappings in NORMAL mode
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    -- LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = 'gc',
        block = 'gbc'
    },
    -- LHS of extra mappings
    extra = {
        above = 'gcO', -- Add comment on line above
        below = 'gco', -- Add comment on line below
        eol = 'gca'    -- Add comment at the end of line
    },

    -- Enable keybindings
    mappings = {
        basic = true,
        extra = true,
    },

    ignore = '^$',

    --Function to call before (un)comment
    ---@diagnostic disable-next-line: assign-type-mismatch
    pre_hook = nil,
    --Function to call after (un)comment
    ---@diagnostic disable-next-line: assign-type-mismatch
    post_hook = nil,
})
