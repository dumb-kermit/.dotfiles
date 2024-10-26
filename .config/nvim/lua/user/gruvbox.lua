local M = {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	event = "UiEnter",
	config = true,
}

function M.config()
	require("gruvbox").setup({
		terminal_colors = true, -- add neovim terminal colors
		undercurl = false,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = true,
			folds = true,
		},
		strikethrough = true,
		invert_selection = true,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "soft", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	})
	vim.cmd("set background=dark")
	vim.cmd("colorscheme gruvbox")
	vim.cmd("hi EndOfBuffer guifg=#31302F")
	vim.cmd("hi SignColumn guibg=#31302F")
	vim.cmd("hi StatusLine guibg=#31302F guifg=#FFB700")

	-- vim.cmd("hi EndOfBuffer guifg=#1D2021")
	-- vim.cmd("hi StatusLine guifg=#1D2021 guibg=#FB4934")
	-- vim.cmd("hi CursorLineNr guibg=#1D2021 guifg=#FB4934")
	-- vim.cmd("hi CursorLineNr guibg=#1D2021 guifg=#FB4934")
	-- vim.cmd("hi NoiceCmdlineIcon guibg=none guifg=#FABD2F")
	-- vim.cmd("hi NoiceCmdlinePopupBorder guibg=none guifg=#FABD2F")
	vim.cmd("hi WhichKeyBorder guifg=#FFB700 guibg=none")
	vim.cmd("hi WhichKeyNormal guibg=none")
	-- vim.cmd("hi NormalFloat guifg=#ebdbb2 guibg=none")
	-- vim.cmd("hi TelescopeResultsBorder guifg=#1d2021 guibg=#1d2021")
	-- vim.cmd("hi TelescopePreviewBorder guifg=#1d2021 guibg=#1d2021")
	-- vim.cmd("hi TelescopePromptBorder guifg=#1d2021 guibg=#1d2021")
	-- vim.cmd("hi TelescopeResultsTitle guifg=#1d2021 guibg=#FABD2F cterm=italic gui=italic")
	-- vim.cmd("hi TelescopePreviewTitle guifg=#1d2021 guibg=#FABD2F cterm=italic gui=italic")
	-- vim.cmd("hi TelescopePromptTitle guifg=#1d2021 guibg=#FABD2F cterm=italic gui=italic")
	-- vim.cmd("hi SignColumn guibg=#1D2021")
end

return M
