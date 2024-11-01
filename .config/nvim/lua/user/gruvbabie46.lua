local M = {
	"luisiacc/gruvbox-baby",
	event = "UiEnter",
}

function M.config()
	vim.g.gruvbox_baby_function_style = "italic"
	vim.g.gruvbox_baby_keyword_style = "italic"
	-- vim.g.gruvbox_baby_background_color = "dark"
	-- vim.g.gruvbox_baby_transparent_mode = true
	vim.g.gruvbox_baby_telescope_theme = 1
	vim.cmd("colorscheme gruvbox-baby")
end
return M
