M = {}

function M.setup()
	vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
	vim.cmd("highlight QuickScopePrimary guifg='#afff5f' gui=underline")
	vim.cmd("highlight QuickScopeSecondary guifg='#5fffff' gui=underline")
end

return M
