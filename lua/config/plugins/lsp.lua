local lsp = require("lsp-zero")
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")

require("config.plugins.neodev")

lsp.preset("recommended")
lsp.nvim_lua_ls()
lsp.ensure_installed({
    'gopls',
    'rust_analyzer',
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    cmd = { 'lua-language-server' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
})

lsp.on_attach(function(client, bufnr)
    require("custom.utils").register_mappings({
        ["n"] = {
            ["gd"] = { function() vim.lsp.buf.definition() end, { desc = "Go to symbol definition", buffer = bufnr } },
            ["K"] = { function() vim.lsp.buf.hover() end, { desc = "Symbol information", buffer = bufnr } },
            ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, { desc = "See code actions", buffer = bufnr } },
            ["<leader>rn"] = { function() vim.lsp.buf.rename() end, { desc = "Rename symbol", buffer = bufnr } },
        }
    })

    -- Navic
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
    navbuddy.attach(client, bufnr)
end)

lsp.format_on_save({
    servers = {
        ["lua_ls"] = { "lua" },
        ["rust_analyzer"] = { "rust" },
        ["gopls"] = { "go" },
    }
})

lsp.setup()
