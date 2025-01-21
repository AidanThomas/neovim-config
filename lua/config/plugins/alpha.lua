local present, alpha = pcall(require, "alpha")
local function alpha_exit()
    vim.api.nvim_exec_autocmds("User", { pattern = "AlphaExit" })
end

if not present then
    return
end

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "AlphaButtons",
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
            vim.api.nvim_feedkeys(key, "normal", false)
            alpha_exit()
        end,
        opts = opts,
    }
end

local function get_version()
    local version = vim.api.nvim_cmd({ cmd = "version" }, { output = true })
    local i = 0
    for line in version:gmatch("([^\n]*)\n?") do
        i = i + 1
        if i == 2 then
            local v = string.sub(line, 6, #line)
            local num_spaces = 45 - #line
            local padding = string.rep(" ", num_spaces)
            return padding .. v
        end
    end
end

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local options = {
    header = {
        type = "text",
        val = {
            "     ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
            "      ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
            "            ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
            "             ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
            "            ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
            "     ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
            "    ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
            "   ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
            "   ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
            "        ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
            "         ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
            " _   _ ______ _____      _______ __  __ ",
            "| \\ | |  ____/ __\\ \\    / /_   _|  \\/  |",
            "|  \\| | |__ | |  |\\ \\  / /  | | | \\  / |",
            "| . ` |  __|| |  | \\ \\/ /   | | | |\\/| |",
            "| |\\  | |___| |__| |\\  /   _| |_| |  | |",
            "|_| \\_|______\\____/  \\/   |_____|_|  |_|",

        },
        opts = {
            position = "center",
            hl = "AlphaHeader",
        },
    },
    buttons = {
        type = "group",
        val = {
            button("n", " New File", ":Scratch<CR>"),
            button("b", "  Browse files", ":Oil<CR>"),
            button("f", "  Find File", ":FzfLua files<CR>"),
            button("w", "󰈭  Find Word", ":FzfLua live_grep<CR>"),
            button("m", "  Marks", ":FzfLua marks<CR>"),
            button("s", "  Settings", ":FzfLua files cwd=~/.config/nvim<CR>"),
        },
        opts = {
            spacing = 1,
        },
    },
    headerPaddingTop = { type = "padding", val = headerPadding },
    headerPaddingVersion = { type = "padding", val = 1 },
    headerPaddingBottom = { type = "padding", val = 1 },
    version = {
        type = "text",
        val = get_version,
        opts = {
            position = "center",
            hl = "Comment"
        },
    },
}

alpha.setup {
    layout = {
        options.headerPaddingTop,
        options.header,
        options.headerPaddingVersion,
        options.version,
        options.headerPaddingBottom,
        options.buttons,
    },
    opts = {},
}
