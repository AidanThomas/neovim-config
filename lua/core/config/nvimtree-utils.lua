M = {}

function M.collapse_all()
	require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

function M.edit_or_open()
	local lib = require("nvim-tree.lib")
	local action = "edit"
	local node = lib.get_node_at_cursor()

	if node.link_to and not node.nodes then
		require("nvim-tree.actions.node.open-file").fn(action, node.link_to)

	elseif node.nodes ~= nil then
		lib.expand_or_collapse(node)

	else
		require("nvim-tree.actions.node.open-file").fn(action, node.absolute_path)

	end

end

function M.vsplit_preview()
	local lib = require("nvim-tree.lib")
	local view = require("nvim-tree.view")
	local action = "vsplit"
	local node = lib.get_node_at_cursor()

	if node.link_to and not node.nodes then
		require("nvim-tree.actions.node.open-file").fn(action, node.link_to)

	elseif node.nodes ~= nil then
		lib.expand_or_collapse(node)

	else
		require("nvim-tree.actions.node.open-file").fn(action, node.absolute_path)

	end
	view.focus()
end

return M
