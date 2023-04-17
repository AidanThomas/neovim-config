local utils = require('core.config.nvimtree-utils')

local options = {
	filters = {
		dotfiles = false,
		custom = { "^.git$" },
	},
	disable_netrw = false,
	hijack_netrw = false,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "edit", action_cb = utils.edit_or_open },
				{ key = "L", action = "vsplit_preview", action_cb = utils.vsplit_preview },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all", action_cb = utils.collapse_all },
			},
		},
		adaptive_size = false,
		side = "left",
		width = 30,
		preserve_window_proportions = true,
	},
	git = {
		enable = true,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
			quit_on_open = false,
		},
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,
		highlight_opened_files = "none",
		indent_markers = {
			enable = false,
		},
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}

return options
