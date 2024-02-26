require("nvterm").setup({
    terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.15,
                col = 0.1,
                width = 0.8,
                height = 0.7,
                border = "none",
            },
            horizontal = { location = "rightbelow", split_ratio = .3 },
            vertical = { location = "rightbelow", split_ratio = .5 },
        }
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
})
