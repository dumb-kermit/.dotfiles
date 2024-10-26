local M = {
	"ptdewey/darkearth-nvim",
	event = "UiEnter",
	-- priority = 1000,
}

function M.config()
	vim.cmd("colorscheme darkearth")
	vim.cmd("hi Identifier guifg=#b1c1e1")
	vim.cmd("hi Number guifg=#b1c1e1")
	vim.cmd("hi Type guifg=#2C3539 cterm=underline gui=underline")
end
return M
