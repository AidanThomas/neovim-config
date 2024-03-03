local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "󰜴 ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules", ".git/", ".git\\" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, --default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_preview_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },

    extensions_list = { "themes", "terms", "file_browser" },

    extensions = {
        file_browser = {
            hijack_netrw = true,
            initial_mode = "normal",
            mappings = {
                ["n"] = {
                    ["<A-r>"] = fb_actions.rename,
                    ["<A-m>"] = fb_actions.move,
                    ["<A-d>"] = fb_actions.remove,
                    ["_"] = fb_actions.goto_parent_dir,
                    -- ["cd"] = function(prompt_bufnr)
                    --     local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                    --     local dir = vim.fn.fnamemodify(picker.path, ":p:h")
                    --     -- require("telescope.actions").close(prompt_bufnr)
                    --     vim.cmd(string.format("silent cd  %s", dir))
                    -- end
                },
                ["i"] = {
                    ["<C-c>"] = fb_actions.create_from_prompt,
                }
            }
        }
    }
})

-- Extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
-- require("telescope").load_extension("make")
