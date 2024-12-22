local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimResized", {
    pattern = "*",
    command = "tabdo wincmd =",
})

autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = augroup("highligh-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("BufWritePost", {
    desc = "Run cfn-lint on yaml files",
    pattern = { "*/cm-dev/platform/*.yaml" },
    group = augroup("YAML Linting", { clear = true }),
    callback = function()
        require("lint").try_lint()
    end
})

autocmd("LspAttach", {
    desc = "Create LSP bindings",
    pattern = { "*" },
    group = augroup("LSP Bindings", { clear = true }),
    callback = function()
        require("custom.utils").register_mappings({
            ["n"] = {
                ["gd"] = { function() vim.lsp.buf.definition() end, { desc = "Go to symbol definition", buffer = bufnr } },
                ["K"] = { function() vim.lsp.buf.hover() end, { desc = "Symbol information", buffer = bufnr } },
                ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, { desc = "See code actions", buffer = bufnr } },
                ["<leader>rn"] = { function() vim.lsp.buf.rename() end, { desc = "Rename symbol", buffer = bufnr } },
            }
        })
    end,
})

local term_config = augroup("Configure Terminal", { clear = true })
autocmd("TermOpen", {
    desc = "Turn off line numbers",
    group = term_config,
    command = "setlocal nonumber"
})

autocmd("TermOpen", {
    desc = "Set term winbar",
    group = term_config,
    callback = function()
        vim.cmd("setlocal filetype=terminal")
        vim.cmd("setlocal winbar=Terminal")
    end
})

autocmd("TermOpen", {
    desc = "Set insert mode",
    group = term_config,
    command = "startinsert",
})

autocmd("BufWritePre", {
    desc = "Organize .go file imports",
    group = augroup("gopls interactions", { clear = true }),
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})
