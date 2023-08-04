vim.opt.termguicolors = true
local colors = require("tokyonight.colors").setup({ style = "night" })
require("bufferline").setup {
	highlights = {
		tab_selected = {
			bold = true,
			bg = colors.bg_highlight,
			italic = false,
		},
		close_button_selected = {
			bold = true,
			italic = false,
		},
		buffer_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		numbers_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		diagnostic_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		hint_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		hint_diagnostic_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		info_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		info_diagnostic_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		warning_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		warning_diagnostic_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		error_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		error_diagnostic_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		modified_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		duplicate_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		separator_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		indicator_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
		pick_selected = {
			bg = colors.bg_highlight,
			bold = true,
			italic = false,
		},
	},
	options = {
		mode = "buffers",              -- set to "tabs" to only show tabpages instead
		themable = true,               -- allows highlight groups to be overriden i.e. sets highlights as default
		numbers = "none",
		close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
		middle_mouse_command = nil,    -- can be a string | function, | false see "Mouse actions"
		indicator = {
			icon = '▎',              -- this should be omitted if indicator style is not 'icon'
			style = 'icon',
		},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		diagnostics_indicator = function(count)
			return "(" .. count .. ")"
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
				end
				return result
			end,
		},
		custom_filter = function(buf_number, buf_numbers)
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[0] ~= buf_number then
				return true
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slope",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		hover = {
			enabled = false,
			delay = 200,
			reveal = { 'close' }
		},
		sort_by = 'id'
	}
}
