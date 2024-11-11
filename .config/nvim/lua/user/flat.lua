local M = {
	"eddyekofo94/gruvbox-flat.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=light")
	-- vim.cmd("set background=dark")
	vim.g.gruvbox_flat_style = "dark"
	-- vim.g.gruvbox_flat_style = "hard"
	vim.cmd([[colorscheme gruvbox-flat]])
end
return M
