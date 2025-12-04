vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.fixendofline = false

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.cursorline = true

local home_dir = os.getenv("HOME")
if home_dir ~= nil then
    vim.opt.undodir = home_dir .. "/.vim/undodir"
end

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.mapleader = " "

vim.diagnostic.config({
    signs = true,
    underline = true,
    virtual_text = {
        spacing = 1,
        min = vim.diagnostic.severity.HINT,
    },
    update_in_insert = true,
})

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.o.cmdheight = 0

vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99

function _G.FoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    if vim.bo.filetype == "go" then
        return "    " .. line .. " …"
    end
    return "" .. line:sub(2) .. " …"
end

vim.opt.foldtext = "v:lua.FoldText()"

vim.opt.fillchars:append({ fold = " ", foldopen = "", foldclose = "" })
