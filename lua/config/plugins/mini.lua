local M = {}
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local load = augroup("Load mini.nvim modules", { clear = true })

M.register_modules = function(modules)
    for _, v in ipairs(modules) do
        local module = v[1]
        local config = M.config[module] or {}
        local event = v[2][1]
        local pattern = v[2][2]

        autocmd(event, {
            desc = "Load " .. module,
            pattern = { pattern },
            group = load,
            callback = function()
                require(module).setup(config)
            end
        })
    end
end

M.config = {
    ["mini.notify"] = {
        content = {
            format = function(notif)
                return "[" .. notif.level .. "] " .. notif.msg
            end
        },
    },
    ["mini.bracketed"] = {
        buffer     = { suffix = 'b' },
        comment    = { suffix = 'c' },
        conflict   = { suffix = 'x' },
        diagnostic = { suffix = '' },
        file       = { suffix = 'f' },
        indent     = { suffix = 'i' },
        jump       = { suffix = 'j' },
        location   = { suffix = 'l' },
        oldfile    = { suffix = 'o' },
        quickfix   = { suffix = 'q' },
        treesitter = { suffix = 't' },
        undo       = { suffix = 'u' },
        window     = { suffix = '' },
        yank       = { suffix = 'y' },
    },
    ["mini.clue"] = {
        triggers = {
            { mode = "n", keys = "<leader>" },
            { mode = "x", keys = "<leader>" },
            { mode = "v", keys = "<leader>" },
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },
            { mode = 'n', keys = '<C-w>' },
        },
        clues = {
            require("mini.clue").gen_clues.builtin_completion(),
            require("mini.clue").gen_clues.g(),
            require("mini.clue").gen_clues.marks(),
            require("mini.clue").gen_clues.registers(),
            require("mini.clue").gen_clues.windows(),
        },
    },
    ["mini.hipatterns"] = {
        highlighters = {
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = '@comment.error' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = '@comment.warning' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = '@comment.todo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = '@comment.note' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = require("mini.hipatterns").gen_highlighter.hex_color({
                style = "inline",
                priority = 2000,
                inline_text = "⬤ ",
            }),
        }
    },
    ["mini.jump2d"] = {
        view = {
            dim = true,
        },
    },
    ["mini.move"] = {
        mappings = {
            left = "H",
            right = "L",
            up = "K",
            down = "J",

            line_left = '',
            line_right = '',
            line_down = '',
            line_up = '',
        }
    },
    ["mini.surround"] = {
        custom_surroundings = {
            ['B'] = { output = { left = '{ ', right = ' }' } }
        }
    },
}

return M
