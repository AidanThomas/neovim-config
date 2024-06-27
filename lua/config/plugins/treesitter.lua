require 'nvim-treesitter.configs'.setup {
    modules = {},

    ignore_install = {},
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "go", "c", "lua", "vim", "vimdoc", "query", "html", "css", "javascript", "markdown_inline" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = { query = "@function.outer", desc = "Select the outer part of a function region" },
                ["if"] = { query = "@function.inner", desc = "Select the inner part of a function region" },
                ["ls"] = { query = "@assignment.lhs", desc = "Select lhs of assignment" },
                ["rs"] = { query = "@assignment.rhs", desc = "Select rhs of assignment" },
                ["ac"] = { query = "@conditional.outer", desc = "Select the outer part of a conditional region" },
                ["ic"] = { query = "@conditional.inner", desc = "Select the inner part of a conditional region" },
                ["ap"] = { query = "@parameter.outer", desc = "Select the outer part of a parameter region" },
                ["ip"] = { query = "@parameter.inner", desc = "Select the inner part of a parameter region" },
            },
            selection_modes = {
                -- ['@parameter.outer'] = 'v', -- charwise
                -- ['@function.outer'] = 'V', -- linewise
                -- ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
        },
    },
}
