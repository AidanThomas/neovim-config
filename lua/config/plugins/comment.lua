require("Comment").setup({
	-- Add a space between comment and line
	padding = true,
	-- Whether the cursor should stay at its position
	sticky = true,
	-- LHS of toggles mappings in NORMAL mode
	toggle = {
		line = 'gcc',
		block = 'gbc',
	},
	-- LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		line = 'gc',
		block = 'gbc'
	},
	-- LHS of extra mappings
	extra = {
		above = 'gcO', -- Add comment on line above
		below = 'gco', -- Add comment on line below
		eol = 'gca' -- Add comment at the end of line
	},

	-- Enable keybindings
	mappings = {
		basic = true,
		extra = true,
	},

	--Function to call before (un)comment
	pre_hook = nil,
	--Function to call after (un)comment
	post_hook = nil,

	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, simlilar to targets.vim
			lookahead = true,

			keymaps = {
				["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
				["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
				["ac"] = { query = "@class.outer", desc = "Select out part of a class region" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},

			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},

			include_surrounding_whitespace = true,
		},
	},
})
