require("conform").setup({
    formatters_by_ft = {
        lua = { "lua_ls" },
        go = { "gopls" },
        -- javascript = { "prettier" },
        json = { "prettier" },
        nix = { "alejandra" },
    },
    format_on_save = {
        timeout = 500,
        lsp_fallback = true,
    }
})
