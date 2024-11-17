local M = {
	"Mofiqul/dracula.nvim",
	event = "UiEnter",
}

function M.config()
	local dracula = require("dracula")
	dracula.setup({
		-- customize dracula color palette
		colors = {
			-- bg = "#242424",
			-- fg = "#c0caf5",
			-- selection = "#242424",
			-- comment = "#545454",
			-- red = "#ff5555",
			orange = "#ffcb6b",
			-- yellow = "#ffcb6b",
			-- green = "#50fa7b",
			purple = "#c792ea",
			-- cyan = "#8be9fd",
			-- pink = "#82aaff",
			bright_red = "#ff6e6e",
			bright_green = "#69ff94",
			bright_yellow = "#FFFFA5",
			bright_blue = "#D6ACFF",
			bright_magenta = "#FF92DF",
			bright_cyan = "#A4FFFF",
			-- bright_white = "#c0caf5",
			-- menu = "#242424",
			-- visual = "#3E4452",
			-- gutter_fg = "#c0caf5",
			-- nontext = "#242424",
			-- white = "#c0caf5",
			-- black = "#242424",

			bg = "#282936",
			fg = "#e9e9f4",
			gutter_fg = "#e9e9f4",
			white = "#e9e9f4",
			bright_white = "#e9e9f4",
			black = "#282936",
			comment = "#626483",
			selection = "#282936",
			red = "#c197fd",
			yellow = "#62d6e8",
			blue = "#50fa7b",
			green = "#F1FA8C",
			puprle = "#ff86d3",
			cyan = "#8BE9FD",
			menu = "#282936",
			nontext = "#282936",
			visual = "#626483",

			pink = "#FF92DF",
		},
		-- show the '~' characters after the end of buffers
		show_end_of_buffer = false, -- default false
		-- use transparent background
		transparent_bg = false, -- default false
		-- set custom lualine background color
		lualine_bg_color = "#282936", -- default nil
		-- set italic comment
		italic_comment = true, -- default false
		-- overrides the default highlights with table see `:h synIDattr`
		overrides = {},
		-- You can use overrides as table like this
		-- overrides = {
		--   NonText = { fg = "white" }, -- set NonText fg to white
		--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
		--   Nothing = {} -- clear highlight of Nothing
		-- },
		-- Or you can also use it like a function to get color from theme
		-- overrides = function (colors)
		--   return {
		--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
		--   }
		-- end,
	})
	vim.cmd("colorscheme dracula")
end

return M
