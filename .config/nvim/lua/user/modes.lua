local M = {
	"mvllow/modes.nvim",
	event = "BufReadPost",
}

function M.config()
	require("modes").setup({
		colors = {
			-- bg = "#B9BB27",
			-- bg = "", -- Optional bg param, defaults to Normal hl group
			copy = "#83A598",
			delete = "#D3859B",
			insert = "#B9BB27",
			visual = "#FE8018",
		},

		-- Set opacity for cursorline and number background
		line_opacity = 0.3,

		-- Enable cursor highlights
		set_cursor = true,

		-- Enable cursorline initially, and disable cursorline for inactive windows
		-- or ignored filetypes
		set_cursorline = true,

		-- Enable line number highlights to match cursorline
		set_number = true,

		-- Disable modes highlights in specified filetypes
		-- Please PR commonly ignored filetypes
		ignore_filetypes = { "NvimTree", "TelescopePrompt" },
	})
end
return M
