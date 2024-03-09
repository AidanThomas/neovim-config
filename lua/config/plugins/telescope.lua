local fb_actions = require("telescope").extensions.file_browser.actions
local actions = require("telescope.actions")

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
                mirror = true,
                prompt_position = "top",
            },
            flex = {
                flip_columns = 140,
            },
            width = 0.87,
            height = 0.80,
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
            n = {
                ["q"] = require("telescope.actions").close,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
            },
        },
    },

    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                },
                n = {
                    ["d"] = actions.delete_buffer + actions.move_to_top
                }
            }
        },
        colorscheme = {
            enable_preview = true
        },
    },

    extensions_list = { "themes", "terms", "file_browser" },

    extensions = {
        file_browser = {
            hijack_netrw = true,
            initial_mode = "normal",
            mappings = {
                ["n"] = {
                    ["<r>"] = fb_actions.rename,
                    ["<m>"] = fb_actions.move,
                    ["<d>"] = fb_actions.remove,
                    ["_"] = fb_actions.goto_parent_dir,
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
