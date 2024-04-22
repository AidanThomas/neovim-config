local navic = require("nvim-navic")

local function get_dir()
    local path = vim.fn.expand("%:.:h")
    local sep = "/"
    local t = {}
    for str in string.gmatch(path, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    path = ""
    for i, v in ipairs(t) do
        if i == #t then
            path = path .. v
        else
            path = path .. v .. "  "
        end
    end

    return path
end

local function get_dir_inactive()
    local path = vim.fn.expand("%:.")
    local sep = "/"
    local t = {}
    for str in string.gmatch(path, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    path = ""
    for i, v in ipairs(t) do
        if i == #t then
            path = path .. v
        else
            path = path .. v .. "  "
        end
    end

    return path
end

local colours = vim.g.colors_name
if colours == "catppuccin-mocha" then colours = "catppuccin" end -- Catppuccin doesn't set name correctly
local custom_theme = require("config.themes." .. colours .. ".lualine")

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            'alpha',
            'TelescopePrompt',
            'lazy',
            status_line = {},
            winbar = {
                'trouble',
                'trouble_preview',
                'terminal',
                'qf', -- quickfix list
            },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            status_line = 1000,
            tabline = 1000,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
    },
    winbar = {
        lualine_a = { get_dir },
        lualine_b = { 'filename' },
        lualine_c = {
            {
                'navic',
                color = { bg = "#11111B" },
            },
        },
        lualine_x = { 'searchcount', 'selectioncount', 'diagnostics' },
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {
        },
        lualine_b = {
        },
        lualine_c = {
            {
                get_dir_inactive,
            },
        },
        lualine_x = {},
        lualine_y = { 'diagnostics' },
        lualine_z = {
        }
    },
    extensions = {}
}
