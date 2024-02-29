local maps = require("remap")
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

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings(maps.cmp_maps(cmp, cmp_select))

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

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    maps.lsp_maps(bufnr)

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
