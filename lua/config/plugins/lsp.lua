local M = {}

M.setup = function(opts)
    require("mason").setup()

    local lspconfig = require("lspconfig")
    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")

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

    for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilites)
        lspconfig[server].setup(config)
    end
end

return M
