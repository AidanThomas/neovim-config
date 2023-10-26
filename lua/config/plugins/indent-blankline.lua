require("ibl").setup({
	enabled = true,
	debounce = 100,
	indent = {
		char = "|",
		tab_char = "|",
	},
	whitespace = {
		highlight = { "Whitespace", "NonText" },
		remove_blankline_trail = true
	},
	scope = {
		enabled = false,
		injected_languages = true,
	}
})
