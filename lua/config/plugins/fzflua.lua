local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
    "default-title",
    files = {
        file_icons = "mini",
        git_icons = false,
    },
    git = {
        files = { file_icons = "mini" },
        status = { file_icons = "mini" },
    },
    grep = {
        file_icons = "mini",
        actions = {
            ["ctrl-q"] = {
                fn = actions.file_edit_or_qf,
                prefix = "select-all+",
            },
        }
    },
    buffers = { file_icons = "mini" },
    tabs = { file_icons = "mini" },
    lines = { file_icons = "mini" },
    blines = { file_icons = "mini" },
    tags = { file_icons = "mini" },
    btags = { file_icons = "mini" },
    quickfix = { file_icons = "mini" },
    lsp = { file_icons = "mini" },
    diagnostics = { file_icons = "mini" },
})
