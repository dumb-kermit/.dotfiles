local M = {
	"eddyekofo94/gruvbox-flat.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=light")
	-- vim.cmd("set background=dark")
	-- vim.g.gruvbox_flat_style = "dark"
	vim.g.gruvbox_flat_style = "hard"
	vim.cmd([[colorscheme gruvbox-flat]])
	vim.cmd("hi Comment guifg=#BAB6B4")
	vim.cmd("hi StatusLine guibg=#CBC6C4 guifg=#3a484c")
end
return M
