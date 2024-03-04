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
