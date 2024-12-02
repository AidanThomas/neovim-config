require("mason").setup()

local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Override floating preview globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Defaults
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    on_attach = function(client, bufnr)
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
    end,
})


-- lua_ls
lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                }
            },
        })
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        }
    }
}

-- gopls
lspconfig.gopls.setup {}

-- csharp_ls
lspconfig.csharp_ls.setup {}

-- typecscript-language-server
lspconfig.tsserver.setup {}

-- nil ls
lspconfig.nil_ls.setup {}

-- html-lsp
capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup({
    capabilities = capabilities,
})

-- css-lsp
capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
    capabilities = capabilities,
}
