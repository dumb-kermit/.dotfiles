local M = {
	"ptdewey/darkearth-nvim",
	event = "UiEnter",
	-- priority = 1000,
}

function M.config()
	vim.cmd("colorscheme darkearth")
	vim.cmd("hi Identifier guifg=#b1c1e1")
	vim.cmd("hi Number guifg=#b1c1e1")
	vim.cmd("hi Type guifg=#b1c1e1 cterm=underline gui=underline")
	vim.cmd("hi EndOfBuffer guifg=#24211E")
	vim.cmd("hi SignColumn guibg=#24211E")
	vim.cmd("hi LineNr guibg=#07AEB3")
	vim.cmd("hi LineNrAbove guibg=#24211E guifg=#736658")
	vim.cmd("hi LineNrBelow guibg=#24211E guifg=#736658")
	vim.cmd("hi Operator guifg=#07AEB3")
	vim.cmd("hi Delimiter guifg=#07AEB3")
	vim.cmd("hi Number guifg=#07AEB3")
	vim.cmd("hi DelimiterLight guifg=#07AEB3")
end
return M
