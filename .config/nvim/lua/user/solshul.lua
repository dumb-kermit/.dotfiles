local M = {
	"shaunsingh/solarized.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=light")
	vim.g.solarized_italic_comments = true
	vim.g.solarized_italic_keywords = true
	vim.g.solarized_italic_functions = true
	vim.g.solarized_italic_variables = true
	vim.g.solarized_contrast = true
	vim.g.solarized_borders = true
	vim.g.solarized_disable_background = false
	vim.cmd("colorscheme solarized")
	-- vim.cmd("hi StatusLine guibg=#7C9596 guifg=#003742")
end
return M
