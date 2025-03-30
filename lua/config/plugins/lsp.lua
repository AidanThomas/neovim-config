local M = {}

M.setup = function()
    require("mason").setup()

    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")

    -- Configure servers
    local servers = {
        csharp_ls = {
            cmd = { "csharp-ls" },
            root_markers = { "*.sln", "*.csproj" },
            filetypes = { "cs" },
            init_options = {
                AutomaticWorkspaceInit = true,
            }
        },
        css_ls = {
            cmd = { "vscode-css-language-server", "--stdio" },
            root_markers = {},
            filetypes = { "css", "scss", "less" },
            init_options = {
                provideFormatter = true
            },
            single_file_support = true,
            settings = {
                css = { validate = true },
                scss = { validate = true },
                less = { validate = true },
            },
            capabilties = M.get_special_capabilities()
        },
        gopls = {
            cmd = { "gopls" },
            root_markers = { "go.mod", "go.sum" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
        },
        html = {
            cmd = { "vscode-html-language-server", "--stdio" },
            root_markers = { "package.json" },
            filetypes = { "html", "tmpl" },
            single_file_support = true,
            settings = {},
            init_options = {
                provideFormatter = true,
                embeddedLanguages = { css = true, javascript = true },
                configurationSection = { "html", "css", "javascript" },
            },
            capabilities = M.get_special_capabilities()
        },
        lua_ls = {
            cmd = { "lua-language-server" },
            root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
            filetypes = { "lua" },
            single_file_support = true,
            log_level = vim.lsp.protocol.MessageType.Warning,
        },
        nil_ls = {
            cmd = { "nil" },
            root_markers = { "flake.nix" },
            filetypes = { "nix" },
            single_file_support = true,
        },
        ts_ls = {
            cmd = { "typescript-language-server", "--stdio" },
            root_markers = { "tsconfig.json", "jsconfig.json", "package.json" },
            filetypes = {
                "javasscript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.jsx"
            },
            single_file_support = true,
            init_options = {
                hostInfo = "neovim"
            },
        },
    }

    -- Defaults
    vim.lsp.config("*", {
        root_markers = { ".git" },
        on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
            navbuddy.attach(client, bufnr)
        end,
    })

    -- Enable all servers
    local servers_to_enable = {}
    for server, config in pairs(servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilites)
        vim.lsp.config[server] = config
        table.insert(servers_to_enable, server)
    end
    vim.lsp.enable(servers_to_enable)
end

M.get_special_capabilities = function()
    local capabilites = vim.lsp.protocol.make_client_capabilities()
    capabilites.textDocument.completion.completionItem.snippetSupport = true
    return capabilites
end

return M
