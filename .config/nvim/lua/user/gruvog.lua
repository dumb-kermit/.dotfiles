local M = {
	"morhetz/gruvbox",
	event = "UiEnter",
}

function M.config()
	vim.g.gruvbox_contrast_dark = "hard"
	vim.g.gruvbox_improved_strings = 1
	vim.g.gruvbox_improved_warnings = 1
	vim.g.gruvbox_italicize_comments = 1
	vim.g.gruvbox_italicize_strings = 1
	vim.cmd("set background=dark")
	vim.cmd("colorscheme gruvbox")
end
return M
